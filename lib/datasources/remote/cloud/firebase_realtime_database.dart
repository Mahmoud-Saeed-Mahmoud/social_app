import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import '../../../models/implementation/message_implementation.dart';

class FirebaseRealTimeDatabase {
  DatabaseReference ref = FirebaseDatabase.instance.ref('chat_rooms');

  /// send message to chat room with [chatRoomId]
  Future<void> sendMessage(String chatRoomId, MessageModel message) async {
    return await ref.child(chatRoomId).push().set(message.toJson());
  }

  /// get messages from chat room with [chatRoomId]
  ///
  /// returns a stream of [MessageModel]
  Stream<DatabaseEvent> getMessages(String chatRoomId) {
    return ref.child(chatRoomId).orderByChild('timeStamps').onValue;
  }
}
