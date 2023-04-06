import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../models/implementation/message_implementation.dart';

extension MessageModelExtension on MessageModel {
  Widget getMessageWidgetModel() {
    final String uId = FirebaseAuth.instance.currentUser!.uid;
    bool isMe = uId == snederId;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: isMe
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: senderProfileImage!.isEmpty
                      ? const AssetImage('assets/images/unkown_person.png')
                          as ImageProvider
                      : CachedNetworkImageProvider(senderProfileImage!),
                ),
                const SizedBox(width: 10),
                Text(message!),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(message!),
                const SizedBox(width: 10),
                CircleAvatar(
                  radius: 25,
                  backgroundImage: senderProfileImage!.isEmpty
                      ? const AssetImage('assets/images/unkown_person.png')
                          as ImageProvider
                      : CachedNetworkImageProvider(senderProfileImage!),
                ),
              ],
            ),
    );
  }
}
