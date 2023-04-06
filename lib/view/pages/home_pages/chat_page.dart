import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/extensions/user_model_extension.dart';

import '../../../controllers/chat_controller.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);

  final chatController = Get.find<ChatController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.separated(
          physics: const BouncingScrollPhysics(),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: chatController.usersList.length,
          itemBuilder: (_, index) =>
              chatController.usersList[index].getUserChatModel(),
        ),
      ),
    );
  }
}
