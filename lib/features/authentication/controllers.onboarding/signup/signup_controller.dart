import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soul_tunes/data/repositories/authentication.dart';
import 'package:soul_tunes/data/repositories/user/user_model.dart';
import 'package:soul_tunes/data/repositories/user/user_repository.dart';
import 'package:soul_tunes/features/authentication/screens/signup/verifyemail.dart';
import 'package:soul_tunes/utils/constants/image_strings.dart';
import 'package:soul_tunes/utils/pop/full_screen_loader.dart';
import 'package:soul_tunes/utils/pop/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  ///Variable
  final hidePassword = true.obs;
  final privacypolicy = true.obs;
  final email = TextEditingController();
  final lastname = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstname = TextEditingController();
  final phonenumber = TextEditingController();
  final address = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  ///--Signup

  Future<void> signup() async {
    try {
      //Start Loading
      //SFullScreenLoader.openLoadingDialog(
      //'WE are processing Your Information', SImages.deliveredInPlaneIllustations);
      // //Check Intrenet Connection

      //Form Validation

      if (!signupFormKey.currentState!.validate()) {

        return;
      }

      //Privacy Policy Check
      if (!privacypolicy.value) {
        SLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create an account you have to read and acccept the privacy policy');
        return;
      }
      //Register user in the firebase authentication

      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //save authenticated user data in the firebase firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstname.text.trim(),
        lastName: lastname.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phonenumber.text.trim(),
        address: address.text,
        city: city.text,
        state: state.text,
        country: country.text,
        profilePicture: '',
      );

      //show successs message
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      //Show success image
      SLoaders.successSnackBar(
          title: 'Congratulations!',
          message: 'Your account hass been created!Verify Your account');

      //move to verify email screen

      Get.to(() => VerifyEmailScreen(
            email: email.text,
          ));

      //  Get.offAll(() => VerifyEmailScreen(email: user.email));
    } catch (e) {
      //Show errror
      SLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      //Remove Loader
      //SFullScreenLoader.stopLoading();
    }
  }
}
