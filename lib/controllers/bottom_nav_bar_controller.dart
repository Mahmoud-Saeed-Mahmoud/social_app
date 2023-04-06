import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/pages/home_pages/posts_page.dart';

import '../view/pages/home_pages/chat_page.dart';
import '../view/pages/home_pages/profile_page.dart';

class BottomNavBarController extends GetxController {
  RxInt bottomNavBarIndex = 0.obs;

  RxList<String> title = [
    'Home',
    'Chat',
    'Profile',
  ].obs;

  RxList<StatelessWidget> body = [
    PostsPage(),
    ChatPage(),
    ProfilePage(),
  ].obs;

  void changeBottomNavBarIndex(int index) {
    bottomNavBarIndex.value = index;
  }
}
