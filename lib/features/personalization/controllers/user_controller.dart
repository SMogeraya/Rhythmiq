import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:soul_tunes/data/repositories/user/user_model.dart';
import 'package:soul_tunes/data/repositories/user/user_repository.dart';
import 'package:soul_tunes/utils/pop/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    super.onInit();
    fetchuserRecord();
  }

  Future<void> fetchuserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  // Future<void> saveUserRecord(UserCredential? userCredentials) async {
  //   try {
  //     if (userCredentials != null) {
  //       //convert name to first and last name

  //       final nameParts =
  //           UserModel.nameParts(userCredentials.user!.displayName ?? '');
  //       final username =
  //           UserModel.generatUsername(userCredentials.user!.displayName ?? '');

  //       //Map Data
  //       final user = UserModel(
  //         id: userCredentials.user!.uid,
  //         firstName: nameParts[0],
  //         lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
  //         username: username,
  //         email: userCredentials.user!.email ?? '',
  //         phoneNumber: userCredentials.user!.phoneNumber ?? '',
  //         profilePicture: userCredentials.user!.photoURL ?? '',
  //         address: '',
  //         city: '',
  //         state: '',
  //         country: '',
  //       );

  //       // Save user data
  //       await userRepository.saveUserRecord(user);
  //     }
  //   } catch (e) {
  //     SLoaders.warningSnackBar(
  //         title: 'Data not Saved',
  //         message:
  //             'Something went wrong while saving your information. You can resave your data in your profile.');
  //   }
  // }
}
