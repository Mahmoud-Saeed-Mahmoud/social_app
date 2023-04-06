import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/user_controller.dart';
import '../../core/fonts/custom_text_style.dart';

class SignUpForm extends StatelessWidget {
  final GlobalKey<FormState> signUpKey;
  final TextEditingController emailEditingController;
  final TextEditingController passwordEditingController;
  final TextEditingController confirmPasswordEditingController;
  final TextEditingController userNameEditingController;
  final TextEditingController phoneNumberEditingController;

  SignUpForm({
    super.key,
    required this.signUpKey,
    required this.emailEditingController,
    required this.passwordEditingController,
    required this.confirmPasswordEditingController,
    required this.userNameEditingController,
    required this.phoneNumberEditingController,
  });

  final userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: signUpKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: emailEditingController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              prefixIcon: Icon(
                Icons.email,
              ),
              labelText: 'Email',
            ),
          ),
          TextField(
            controller: userNameEditingController,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              prefixIcon: Icon(
                Icons.person,
              ),
              labelText: 'User Name',
            ),
          ),
          TextField(
            controller: phoneNumberEditingController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              prefixIcon: Icon(
                Icons.phone,
              ),
              labelText: 'Phone Number',
            ),
          ),
          GetBuilder<UserController>(
            builder: (controller) {
              return TextField(
                controller: passwordEditingController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: controller.showPassword,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  prefixIcon: const Icon(
                    Icons.lock,
                  ),
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.showPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () => controller.togglePasswordVisibility(),
                  ),
                ),
              );
            },
          ),
          Container(
            decoration: Get.isDarkMode
                ? const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFF301E67),
                        Color(0xFFD27685),
                      ],
                    ),
                  )
                : const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromARGB(255, 87, 197, 182),
                        Color.fromARGB(255, 26, 95, 122),
                        Color.fromARGB(255, 0, 43, 91),
                      ],
                    ),
                  ),
            child: GetBuilder<UserController>(builder: (_) {
              return userController.isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      clipBehavior: Clip.hardEdge,
                      onPressed: () => userController.signUp(
                        email: emailEditingController.text,
                        password: passwordEditingController.text,
                        username: userNameEditingController.text,
                        number: phoneNumberEditingController.text,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0.0,
                      ),
                      child: Text(
                        'Sign Up',
                        style: CustomTextStyle.pacifico.copyWith(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    );
            }),
          ),
        ],
      ),
    );
  }
}
