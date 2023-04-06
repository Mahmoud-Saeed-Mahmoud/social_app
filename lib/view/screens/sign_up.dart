import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/sign_up_page/sign_up_dark.dart';
import '../pages/sign_up_page/sign_up_light.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  static const String routeName = '/sign_up';

  @override
  Widget build(BuildContext context) {
    return Get.isDarkMode ? const SignUpDark() : const SignUpLight();
  }
}
