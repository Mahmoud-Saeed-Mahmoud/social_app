import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/user_controller.dart';
import '../../core/fonts/custom_text_style.dart';

class SignInForm extends StatelessWidget {
  final GlobalKey<FormState> signInKey;
  final TextEditingController emailEditingController;
  final TextEditingController passwordEditingController;

  SignInForm({
    super.key,
    required this.signInKey,
    required this.emailEditingController,
    required this.passwordEditingController,
  });
  final controller = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: signInKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: emailEditingController,
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(
                  Icons.email,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            GetBuilder<UserController>(builder: (controller) {
              return TextField(
                keyboardType: TextInputType.visiblePassword,
                controller: passwordEditingController,
                obscureText: controller.showPassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  prefixIcon: const Icon(
                    Icons.lock,
                  ),
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
            }),
            const SizedBox(
              height: 70,
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
              child: GetBuilder<UserController>(
                builder: (controller) => controller.isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        clipBehavior: Clip.hardEdge,
                        onPressed: () => controller.signIn(
                            email: emailEditingController.text,
                            password: passwordEditingController.text),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0.0,
                        ),
                        child: Text(
                          'Sign in',
                          style: CustomTextStyle.pacifico.copyWith(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'remember me',
                  style: CustomTextStyle.lato.copyWith(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                GetBuilder<UserController>(builder: (controller) {
                  return Checkbox(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.elliptical(20, 10),
                      ),
                    ),
                    value: controller.rememberMe,
                    onChanged: (value) {
                      controller.rememberMe = value!;
                    },
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
