import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/extensions/post_model_extension.dart';

import '../../../controllers/post_controller.dart';

class PostsPage extends StatelessWidget {
  PostsPage({Key? key}) : super(key: key);

  final postsController = Get.find<PostController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => ListView.separated(
          itemCount: postsController.posts.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (_, index) =>
              postsController.posts[index].getPostWidgetModel(),
        ),
      ),
    );
  }
}
