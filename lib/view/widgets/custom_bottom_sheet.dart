import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/post_controller.dart';

class CustomBottomSheet extends StatelessWidget {
  CustomBottomSheet({Key? key}) : super(key: key);

  final TextEditingController _postController = TextEditingController();

  final postController = Get.find<PostController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Create new post',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          TextField(
            controller: _postController,
            autofocus: true,
            keyboardType: TextInputType.multiline,
            maxLines: 7,
            maxLength: 50,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              hintText: 'What\'s on your mind?',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              postController.createPost(_postController.text);
              Get.back();
            },
            child: const Text('Post'),
          ),
        ],
      ),
    );
  }
}
