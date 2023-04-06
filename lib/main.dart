import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'view/screens/chat_room.dart';
import 'bindings/home_binding.dart';
import 'core/themes/dark_theme.dart';
import 'core/themes/light_theme.dart';
import 'view/screens/home.dart';
import 'view/screens/sign_in.dart';

import 'bindings/theme_binding.dart';
import 'bindings/user_binding.dart';
import 'view/screens/sign_up.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();

  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
    overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ],
  );

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
    ),
  );

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final GetStorage _localStorage = GetStorage();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      initialBinding: UserBinding(),
      themeMode: _localStorage.hasData('isDarkMode')
          ? _localStorage.read('isDarkMode')
              ? ThemeMode.dark
              : ThemeMode.light
          : ThemeMode.system,
      theme: LightTheme.call(),
      darkTheme: DarkTheme.call(),
      defaultTransition: Transition.zoom,
      getPages: [
        GetPage(
          bindings: [
            ThemeBinding(),
            _localStorage.hasData('token') ? HomeBinding() : UserBinding(),
          ],
          name: '/',
          page: () =>
              _localStorage.hasData('token') ? const Home() : const SignIn(),
        ),
        GetPage(
          name: '/home',
          page: () => const Home(),
          bindings: [
            ThemeBinding(),
            HomeBinding(),
          ],
        ),
        GetPage(
            name: '/sign_up',
            page: () => const SignUp(),
            binding: UserBinding()),
        GetPage(
            name: '/sign_in',
            page: () => const SignIn(),
            binding: UserBinding()),
        GetPage(
          name: '/chat_room',
          page: () => ChatRoomScreen(),
        ),
      ],
    );
  }
}
