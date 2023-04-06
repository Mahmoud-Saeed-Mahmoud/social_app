import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<String> signIn(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _auth.currentUser!.uid;
    } on FirebaseAuthException {
      Get.snackbar(
        'Error',
        'SomeThing Went Wrong',
        backgroundColor: Colors.redAccent.withOpacity(.67),
      );
      return '';
    } catch (e) {
      Get.snackbar(
        'Error',
        'SomeThing Went Wrong',
        backgroundColor: Colors.redAccent.withOpacity(.67),
      );
      return '';
    }
  }

  Future<String> signUp({
    required String email,
    required String password,
    required String username,
    required String number,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _auth.currentUser!.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar(
          'Error',
          'The password provided is too weak.',
          backgroundColor: Colors.redAccent.withOpacity(.67),
        );
        return '';
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          'Error',
          'The account already exists for that email.',
          backgroundColor: Colors.redAccent.withOpacity(.67),
        );
        return '';
      } else {
        Get.snackbar(
          'Error',
          'SomeThing Went Wrong',
          backgroundColor: Colors.redAccent.withOpacity(.67),
        );
        return '';
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'SomeThing Went Wrong',
        backgroundColor: Colors.redAccent.withOpacity(.67),
      );
      return '';
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
