import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/bottom_nav_bar_controller.dart';

class BottomNavBar extends GetView<BottomNavBarController> {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        currentIndex: controller.bottomNavBarIndex.value,
        useLegacyColorScheme: false,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        onTap: (index) => controller.changeBottomNavBarIndex(index),
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded),
          ),
          BottomNavigationBarItem(
            label: 'Chat',
            icon: Icon(Icons.chat_outlined),
            activeIcon: Icon(Icons.chat_rounded),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person_rounded),
          ),
        ],
      ),
    );
  }
}
