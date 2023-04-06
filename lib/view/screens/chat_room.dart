import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/extensions/message_model_extension.dart';

import '../../controllers/chat_room_controller.dart';
import '../widgets/sliver_app_bar.dart';

class ChatRoomScreen extends StatelessWidget {
  ChatRoomScreen({Key? key}) : super(key: key);

  static const String routeName = '/chat_room';

  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final chatRoomController = Get.find<ChatRoomController>();

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverAppBarWidget(chatRoomController: chatRoomController),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 40,
                    ),
                  ),
                  Obx(
                    () {
                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (_, int index) {
                            return chatRoomController.messages[index]
                                .getMessageWidgetModel();
                          },
                          childCount: chatRoomController.messages.length,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'Type your message...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        chatRoomController.sendMessage(_messageController.text);
                        _messageController.clear();
                      },
                      icon: const Icon(Icons.send_rounded))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
