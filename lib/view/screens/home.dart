import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/bottom_nav_bar_controller.dart';
import '../widgets/bottom_nav_bar.dart';

import '../../controllers/user_controller.dart';
import '../../services/theme_service.dart';
import '../widgets/custom_bottom_sheet.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();
    final themeController = Get.find<ThemeService>();
    final bottomNavBarController = Get.find<BottomNavBarController>();
    return Scaffold(
      appBar: AppBar(
        leading: AnimatedIconButton(
          icons: const [
            AnimatedIconItem(
              icon: Icon(Icons.light_mode_outlined),
            ),
            AnimatedIconItem(
              icon: Icon(Icons.dark_mode_outlined),
            ),
          ],
          onPressed: () => themeController.toggleTheme(!Get.isDarkMode),
        ),
        title: Obx(
          () => Text(bottomNavBarController
              .title[bottomNavBarController.bottomNavBarIndex.value]),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Get.bottomSheet(
              CustomBottomSheet(),
              backgroundColor:
                  Get.isDarkMode ? Colors.brown.shade900 : Colors.blue.shade200,
              clipBehavior: Clip.antiAlias,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
            icon: const Icon(Icons.edit_square),
          ),
          const SizedBox(
            width: 20,
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              userController.signOut();
            },
          )
        ],
      ),
      body: Obx(
        () => bottomNavBarController
            .body[bottomNavBarController.bottomNavBarIndex.value],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
