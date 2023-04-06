import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../datasources/remote/cloud/firebase_firestore.dart';
import '../datasources/remote/cloud/firebase_realtime_database.dart';
import '../models/implementation/user_implementation.dart';
import '../models/interfaces/i_message.dart';

import '../models/implementation/message_implementation.dart';

class ChatRoomController extends GetxController implements IMessage {
  FirebaseRealTimeDatabase chatRoom = FirebaseRealTimeDatabase();

  final String _currUserId = FirebaseAuth.instance.currentUser!.uid;

  Rx<UserModel> currEndUser = UserModel().obs;

  RxList<MessageModel> messages = <MessageModel>[].obs;

  @override
  void onInit() {
    ever(currEndUser, (callback) => getMessages());
    super.onInit();
  }

  /// create chat room id with [_currUserId] and [currEndUser.value.uid]
  ///
  /// send message to chat room with [chatRoomId]
  @override
  void sendMessage(String text) async {
    final List<String> uids = [_currUserId, currEndUser.value.uid!]..sort();
    final String chatRoomId = uids.join('-');

    final user = await FirebaseFirestoreImp().getUserData(_currUserId);

    MessageModel message = MessageModel(
      snederId: _currUserId,
      senderProfileImage: user.profileImage,
      receiverProfileImage: currEndUser.value.profileImage,
      receiverId: currEndUser.value.uid ?? '',
      message: text,
      timeStamps: DateTime.now().toString(),
    );

    chatRoom.sendMessage(chatRoomId, message);
  }

  /// get messages from chat room.
  ///
  /// returns a stream of [MessageModel].
  void getMessages() async {
    final List<String> uids = [_currUserId, currEndUser.value.uid!]..sort();
    final String chatRoomId = uids.join('-');
    chatRoom.getMessages(chatRoomId).listen((event) {
      messages.assignAll(event.snapshot.children
          .map((e) => MessageModel.fromJson(e.value.toString()))
          .toList());
    });
    update();
  }
}
