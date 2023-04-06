import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final profileController = Get.find<ProfileController>();

  final TextEditingController bioController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Obx(
                        () => Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFF754F44).withOpacity(0.19),
                            image: profileController
                                    .userModel.value.coverImage!.isEmpty
                                ? null
                                : DecorationImage(
                                    fit: BoxFit.cover,
                                    image: CachedNetworkImageProvider(
                                      profileController
                                          .userModel.value.coverImage!,
                                    ),
                                  ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                right: 0,
                                top: 0,
                                child: GetBuilder<ProfileController>(
                                    builder: (controller) {
                                  return IconButton(
                                    onPressed: () =>
                                        controller.editCoverImage(),
                                    icon: Icon(
                                      Icons.camera_alt,
                                      color: Colors.deepOrange.shade100,
                                    ),
                                  );
                                }),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFF754F44).withOpacity(0.19),
                          image: profileController
                                  .userModel.value.profileImage!.isEmpty
                              ? null
                              : DecorationImage(
                                  fit: BoxFit.cover,
                                  image: CachedNetworkImageProvider(
                                    profileController
                                        .userModel.value.profileImage!,
                                  ),
                                ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: GetBuilder<ProfileController>(
                                  builder: (controller) {
                                return IconButton(
                                  onPressed: () =>
                                      controller.editProfileImage(),
                                  icon: Icon(
                                    Icons.camera_alt,
                                    color: Colors.deepOrange.shade100,
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Obx(
                  () {
                    bioController.text = profileController.userModel.value.bio!;
                    return TextField(
                      controller: bioController,
                      onSubmitted: (bio) => profileController.updateUserData(
                        uId: profileController.uId,
                        bio: bio,
                      ),
                      keyboardType: TextInputType.text,
                      maxLines: 4,
                      maxLength: 100,
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        labelText: 'Bio',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Obx(
                  () {
                    userNameController.text =
                        profileController.userModel.value.username!;
                    return TextField(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        labelText: 'Username',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      controller: userNameController,
                      onSubmitted: (username) =>
                          profileController.updateUserData(
                        uId: profileController.uId,
                        username: username,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
