import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/fonts/custom_text_style.dart';
import '../../screens/sign_up.dart';
import '../../widgets/sign_in_form.dart';

final GlobalKey<FormState> _signInKey = GlobalKey<FormState>();

final _emailEditingController = TextEditingController();
final _passwordEditingController = TextEditingController();

class SignInDark extends StatelessWidget {
  const SignInDark({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFFD27685),
              Color(0xFF66347F),
              Color(0xFF37306B),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'don\'t have an account?',
                      style: CustomTextStyle.lato.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0.3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.blue.shade200.withOpacity(.7),
                      ),
                      onPressed: () => Get.to(() => const SignUp(),
                          transition: Transition.rightToLeftWithFade),
                      child: Text(
                        'Sign up',
                        style: CustomTextStyle.lato.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Social App',
                  textAlign: TextAlign.center,
                  style: CustomTextStyle.pacifico.copyWith(
                    color: Colors.white,
                    fontSize: 50,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Card(
                    color: Colors.transparent,
                    elevation: .3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SingleChildScrollView(
                      child: Center(
                        child: SignInForm(
                          signInKey: _signInKey,
                          emailEditingController: _emailEditingController,
                          passwordEditingController: _passwordEditingController,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
