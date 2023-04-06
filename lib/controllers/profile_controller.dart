import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'chat_controller.dart';

import '../datasources/remote/cloud/firebase_firestore.dart';
import '../models/implementation/user_implementation.dart';

class ProfileController extends GetxController {
  @override
  void onInit() {
    getUserData();

    super.onInit();
  }

  /// Upload the image to the firebase storage.
  ///
  /// Return the download url of the image.
  ///
  /// If the image is not uploaded successfully, return null.
  ///
  /// Otherwise, return the download url of the image.
  Future<void> editProfileImage() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      try {
        final ref = FirebaseStorage.instance
            .ref()
            .child('users')
            .child('${FirebaseAuth.instance.currentUser!.uid}profile_image');
        await ref.putFile(File(image.path)).then((p0) async => updateUserData(
            uId: uId, profileImage: await p0.ref.getDownloadURL()));
      } catch (e) {
        Get.snackbar(
          'Error',
          'Failed to upload image',
        );
      }
    }
  }

  String uId = FirebaseAuth.instance.currentUser!.uid;
  Future<void> editCoverImage() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      try {
        // Upload the image to the bucket.
        final ref = FirebaseStorage.instance
            .ref()
            .child('users')
            .child('${uId}cover_image');
        await ref.putFile(File(image.path)).then((p0) async => updateUserData(
            uId: uId, coverImage: await p0.ref.getDownloadURL()));
      } catch (e) {
        Get.snackbar(
          'Error',
          'Failed to upload image',
        );
      }
    }
  }

  ChatController chatController = ChatController();
  FirebaseFirestoreImp userData = FirebaseFirestoreImp();
  Rx<UserModel> userModel = UserModel().obs;

  /// Update the user data.
  ///
  /// Return the updated user data.
  ///
  /// If the user data is not updated successfully, return null.
  ///
  /// Otherwise, return the updated user data.

  Future<void> updateUserData(
      {required String uId,
      String? username,
      String? bio,
      String? profileImage,
      String? coverImage}) async {
    await userData
        .updateUserData(
            uId: uId,
            username: username,
            bio: bio,
            profileImage: profileImage,
            coverImage: coverImage)
        .then((_) => getUserData());
  }

  /// Get the user data.
  ///
  /// Return the user data.
  ///
  /// If the user data is not fetched successfully, return null.
  ///
  /// Otherwise, return the user data.

  Future<void> getUserData() async {
    userModel.value = await userData.getUserData(uId);
    chatController.getUsers();
    update();
  }
}
