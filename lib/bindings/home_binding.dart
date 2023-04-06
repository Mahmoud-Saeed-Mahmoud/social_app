import 'package:get/get.dart';
import '../controllers/chat_controller.dart';
import '../controllers/post_controller.dart';

import '../controllers/bottom_nav_bar_controller.dart';
import '../controllers/chat_room_controller.dart';
import '../controllers/profile_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavBarController>(() => BottomNavBarController());

    Get.lazyPut<ProfileController>(() => ProfileController());

    Get.lazyPut<ChatController>(() => ChatController());

    Get.lazyPut<ChatRoomController>(() => ChatRoomController());

    Get.lazyPut<PostController>(() => PostController());
  }
}
