import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../datasources/local/local_storage_implementaion.dart';

class ThemeService extends GetxService {
  void toggleTheme(bool isDarkModeEnabeled) {
    isDarkModeEnabeled
        ? Get.changeThemeMode(ThemeMode.dark)
        : Get.changeThemeMode(ThemeMode.light);
    LocalStorageImplementaion().write('isDarkMode', isDarkModeEnabeled);
  }
}
