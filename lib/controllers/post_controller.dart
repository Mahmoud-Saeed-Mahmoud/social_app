import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../datasources/remote/cloud/firebase_firestore.dart';
import '../models/implementation/post_implementation.dart';
import '../models/implementation/user_implementation.dart';
import '../models/interfaces/i_post.dart';

class PostController extends GetxController implements IPost {
  late UserModel user;
  @override
  void createPost(String postContent) async {
    PostModel post = PostModel(
      uid: user.uid,
      author: user.username,
      profileImage: user.profileImage,
      postContent: postContent,
      postTime: DateTime.now().toString(),
    );

    FirebaseFirestoreImp().createPost(post);
  }

  RxList<PostModel> posts = <PostModel>[].obs;

  @override
  void getPosts() async {
    posts.bindStream(FirebaseFirestoreImp().getPostsStream());
    update();
  }

  @override
  void onInit() async {
    user = await FirebaseFirestoreImp()
        .getUserData(FirebaseAuth.instance.currentUser!.uid);
    getPosts();
    super.onInit();
  }
}
