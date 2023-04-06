import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../controllers/chat_controller.dart';

import '../../models/implementation/user_implementation.dart';

extension UserModelExtension on UserModel {
  Widget getUserChatModel() {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      elevation: 5,
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        onTap: () => ChatController().navigateToChat(this),
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: profileImage!.isEmpty
              ? const AssetImage('assets/images/unkown_person.png')
                  as ImageProvider
              : CachedNetworkImageProvider(profileImage!),
        ),
        title: Text(
          username ?? '',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
