import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/chat_room_controller.dart';

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({
    super.key,
    required this.chatRoomController,
  });

  final ChatRoomController chatRoomController;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      stretch: true,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              chatRoomController.currEndUser.value.username!,
              overflow: TextOverflow.ellipsis,
            ),
            CircleAvatar(
              radius: 30,
              backgroundImage:
                  chatRoomController.currEndUser.value.profileImage!.isEmpty
                      ? const AssetImage('assets/images/unkown_person.png')
                          as ImageProvider
                      : CachedNetworkImageProvider(
                          chatRoomController.currEndUser.value.profileImage!,
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
