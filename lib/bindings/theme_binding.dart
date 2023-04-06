import 'package:get/get.dart';

import '../services/theme_service.dart';

class ThemeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThemeService>(() => ThemeService());
  }
}
