import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../view/screens/chat_room.dart';
import '../datasources/remote/cloud/firebase_firestore.dart';
import '../models/implementation/user_implementation.dart';
import 'chat_room_controller.dart';

class ChatController extends GetxController {
  FirebaseFirestoreImp userData = FirebaseFirestoreImp();

  final String _currUserId = FirebaseAuth.instance.currentUser!.uid;

  RxList<UserModel> usersList = <UserModel>[].obs;

  final ChatRoomController chatRoomController = Get.find<ChatRoomController>();

  void getUsers() async {
    usersList.bindStream(userData.getUsersList(_currUserId));
    update();
  }

  void navigateToChat(UserModel user) {
    chatRoomController.currEndUser.value = user;
    Get.toNamed(ChatRoomScreen.routeName);
  }

  @override
  void onInit() {
    super.onInit();
    getUsers();
  }
}
