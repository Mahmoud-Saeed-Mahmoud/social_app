import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

import '../controllers/user_controller.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(() => UserController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
