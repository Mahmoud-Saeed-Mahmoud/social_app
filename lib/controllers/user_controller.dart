import 'package:get/get.dart';
import '../datasources/local/local_storage_implementaion.dart';
import '../datasources/remote/auth/firebase_auth.dart';
import '../datasources/remote/cloud/firebase_firestore.dart';
import '../models/interfaces/i_user.dart';
import '../view/screens/sign_in.dart';

import '../view/screens/home.dart';

class UserController extends GetxController implements IUser {
  bool isLoading = false;

  //ignore: prefer_final_fields
  bool _showPassword = true;
  bool get showPassword => _showPassword;

  /// toggle password visibility
  void togglePasswordVisibility() {
    _showPassword = !_showPassword;
    update();
  }

  final _localStorage = LocalStorageImplementaion();

  bool _rememberMe = false;
  bool get rememberMe => _rememberMe;

  /// toggle remember me
  ///
  /// if true, the user will be remembered on next sign in
  ///
  /// if false, the user will be asked to reauth next sign in
  set rememberMe(bool value) {
    _rememberMe = value;
    update();
  }

  /// sign in with [email] and [password]
  ///
  /// If the user is successfully signed in,
  /// the user will be redirected to the home screen.
  ///
  /// If the user is not signed in,
  /// the user will be redirected to the sign in screen.
  @override
  Future<void> signIn({required String email, required String password}) async {
    isLoading = true;
    update();
    await UserAuth().signIn(email: email, password: password).then((uId) {
      if (_rememberMe && uId.isNotEmpty) {
        _localStorage.write('token', uId);
        Get.offAllNamed(Home.routeName);
      } else if (uId.isNotEmpty) {
        Get.offAllNamed(Home.routeName);
      }
      isLoading = false;
      update();
    });
  }

  /// sign up with [email], [password] , [username] and [number]
  /// If the user is successfully signed up,
  /// the user will be redirected to the home screen.
  ///
  /// If the user is not signed up,
  /// the user will be redirected to the sign up screen.
  @override
  Future<void> signUp({
    required String email,
    required String password,
    required String username,
    required String number,
  }) async {
    isLoading = true;
    update();
    UserAuth()
        .signUp(
      email: email,
      password: password,
      username: username,
      number: number,
    )
        .then((uId) {
      if (uId.isNotEmpty) {
        FirebaseFirestoreImp().registerNewUser(
          uId: uId,
          email: email,
          password: password,
          username: username,
          number: number,
        );
        Get.offAllNamed(Home.routeName);
      }
    });
    isLoading = false;
    update();
  }

  /// end the current session
  @override
  Future<void> signOut() async {
    UserAuth()
        .signOut()
        .then((_) => _localStorage.remove('token'))
        .whenComplete(() => Get.offAllNamed(SignIn.routeName));
  }
}
