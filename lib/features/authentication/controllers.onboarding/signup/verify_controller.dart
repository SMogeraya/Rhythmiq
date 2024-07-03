import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:soul_tunes/commen/widget/success_screen/success_screen.dart';
import 'package:soul_tunes/data/repositories/authentication.dart';
import 'package:soul_tunes/utils/constants/image_strings.dart';
import 'package:soul_tunes/utils/constants/text_strings.dart';
import 'package:soul_tunes/utils/pop/loaders.dart';
import 'dart:async';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  ///Send Email Verification Link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      SLoaders.successSnackBar(
          title: "Your Email Sent!!", message: "Please check in your mail box");
    } catch (e) {
      SLoaders.errorSnackBar(title: "Oh Snap!", message: "e.toString()");
    }
  }

  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();

      ///Every second we reload the currentuser to check if verified
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
              title: STexts.yourAccountCreatedTitle,
              subtitle: STexts.yourAccountCreatedSubTitle,
              image: SImages.staticSuccessIllustrations,
              onPressed: () => AuthenticationRepository().screenRedirect(),
            ));
      }
      //  else {
      //   SLoaders.errorSnackBar(title: "Oh Snap!", message: "toString()");
      // }
    });
  }

  ///Manuly check email verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
            title: STexts.yourAccountCreatedTitle,
            subtitle: STexts.yourAccountCreatedSubTitle,
            image: SImages.staticSuccessIllustrations,
            onPressed: () => AuthenticationRepository().screenRedirect(),
          ));
    }
    // } else {
    //   SLoaders.errorSnackBar(title: "Oh Snap!", message: "toString()");
    // }
  }
}
