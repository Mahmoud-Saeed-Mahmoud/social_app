import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/sign_in_page/sign_in_dark.dart';
import '../pages/sign_in_page/sign_in_light.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  static const String routeName = '/sign_in';

  @override
  Widget build(BuildContext context) {
    return Get.isDarkMode ? const SignInDark() : const SignInLight();
  }
}
