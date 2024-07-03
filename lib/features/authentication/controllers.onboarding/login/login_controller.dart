import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:soul_tunes/data/repositories/authentication.dart';
//import 'package:soul_tunes/features/shop/screens/home/home.dart';
import 'package:soul_tunes/navigationmenu.dart';
//import 'package:soul_tunes/utils/constants/image_strings.dart';
import 'package:soul_tunes/utils/pop/full_screen_loader.dart';
import 'package:soul_tunes/utils/pop/loaders.dart';

class LoginController extends GetxController {
  LoginController({
    required this.dark1,
    required this.image,
    required this.title,
    required this.saleprice,
    required this.finalprice,
    required this.brand,
    required this.discount,
    required this.ratings,
    required this.index,
  });

  final bool dark1;
  final String image;
  final String title;
  final String saleprice;
  final int finalprice;
  final String brand;
  final String discount;
  final String ratings;
  final int index;
//  @override
//    void onInit() {

//     email.text = localStorage.read('REMEMBER_ME_EMAIL');
//      password.text = localStorage.read('REMEMBER_ME_PASSWORD');

//     super.onInit();
//   }

  ///Variable
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final rememberme = false.obs;
  final hidepassword = true.obs;
  final localStorage = GetStorage();

  ///---Email and Password SignIn
  Future<void> emailAndPasswordSignIn() async {
    try {
      //start Loading
      //// SFullScreenLoader.openLoadingDialog(
      // "Logging You In...", SImages.loadinganime);

      //Check INternet Connectivity
      ///final isConnected =await NetworkManager.instance.isConnected();
      // if(!isConnected)
      // {
      //   SFullScreenLoader.stopLoading();
      //   return;
      // }

      //Form Validation
      if (!loginFormKey.currentState!.validate()) {
        return;
      }
      //Save Data if Remember Me is selected
      if (rememberme.value) {
        localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      }

      //Login User Using Email Abd Password
      final userCredential = await AuthenticationRepository.instance
          .loginwithEmailAndPassword(email.text.trim(), password.text.trim());

      //Remove Loader
      // SFullScreenLoader.stopLoading();

      //Redirect
      //AuthenticationRepository.instance.screenRedirect();
      Get.to(() => NavigationMenu(
          dark: dark1,
          image: image,
          title: title,
          saleprice: saleprice,
          finalprice: finalprice,
          brand: brand,
          discount: discount,
          ratings: ratings,
          index: index));
    } catch (e) {
      // SFullScreenLoader.stopLoading();
      SLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
