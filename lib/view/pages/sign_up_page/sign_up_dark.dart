import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/sign_up_form.dart';

final GlobalKey<FormState> _signUpKey = GlobalKey<FormState>();

final _emailEditingController = TextEditingController();
final _passwordEditingController = TextEditingController();
final _confirmPasswordEditingController = TextEditingController();
final _userNameEditingController = TextEditingController();
final _phoneNumberEditingController = TextEditingController();

class SignUpDark extends StatelessWidget {
  const SignUpDark({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
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
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: SignUpForm(
              signUpKey: _signUpKey,
              emailEditingController: _emailEditingController,
              passwordEditingController: _passwordEditingController,
              confirmPasswordEditingController:
                  _confirmPasswordEditingController,
              userNameEditingController: _userNameEditingController,
              phoneNumberEditingController: _phoneNumberEditingController,
            ),
          ),
        ),
      ),
    );
  }
}
