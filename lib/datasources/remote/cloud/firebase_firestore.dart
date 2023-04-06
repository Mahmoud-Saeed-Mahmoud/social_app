import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/implementation/post_implementation.dart';
import '../../../models/implementation/user_implementation.dart';

class FirebaseFirestoreImp {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Get the user data of [uId] from the firebase.
  /// If the user data is not found, return `Null`.
  /// Otherwise, return the user data as `UserModel`.
  Future<UserModel> getUserData(uId) async {
    return (_firestore.collection('users').doc(uId).get().then((value) {
      _user = UserModel.fromMap(value.data()!);
      return UserModel.fromMap(value.data()!);
    }));
  }

  UserModel? _user;

  /// Update the user data of [uId].
  ///
  /// takes required [uId] and optionally [username], [bio], [profileImage] and [coverImage]
  /// as parameters
  ///
  /// If the user data is not updated successfully, return `Null`.
  /// Otherwise, return the updated user data as `UserModel`.
  Future<void> updateUserData(
      {required String uId,
      String? username,
      String? bio,
      String? profileImage,
      String? coverImage}) async {
    await _firestore.collection('users').doc(uId).update({
      'username': username ?? _user!.username,
      'bio': bio ?? _user!.bio,
      'profileImage': profileImage ?? _user!.profileImage,
      'coverImage': coverImage ?? _user!.coverImage,
    });
  }

  /// Register a new user with [email], [password] , [username] and [number]
  /// as parameters
  ///
  /// If the user data is not registered successfully, return `Null`.
  /// Otherwise, return the user data as `UserModel`.
  Future<void> registerNewUser(
      {required String uId,
      required String email,
      required String password,
      required String username,
      required String number}) async {
    await _firestore.collection('users').doc(uId).set(UserModel(
          uid: uId,
          email: email,
          username: username,
          number: number,
          bio: '',
          profileImage: '',
          coverImage: '',
        ).toMap());
  }

  /// Get the users list from the [FirebaseFirestore].
  /// If the user list is not fetched successfully, return `Null`.
  /// Otherwise, return the users as `List<UserModel>`.

  Stream<List<UserModel>> getUsersList(String currUserId) {
    return (_firestore
        .collection('users')
        .where('uid', isNotEqualTo: currUserId)
        .snapshots()
        .map((value) {
      return value.docs.map((e) => UserModel.fromMap(e.data())).toList();
    }));
  }

  ///create post
  ///
  /// takes required [postModel] as parameter
  ///
  /// If the post data is not created successfully, return `Null`.
  /// Otherwise, return the post data as `PostModel`.

  Future<void> createPost(PostModel postModel) async {
    await _firestore.collection('posts').add(postModel.toMap());
  }

  /// Get the posts from the [FirebaseFirestore].
  /// If the post is not fetched successfully, return `Null`.
  /// Otherwise, return the posts as `Stream<List<PostModel>>`.

  Stream<List<PostModel>> getPostsStream() {
    return _firestore
        .collection('posts')
        .orderBy('postTime', descending: true)
        .snapshots()
        .map((value) {
      return value.docs.map((e) => PostModel.fromMap(e.data())).toList();
    });
  }
}
