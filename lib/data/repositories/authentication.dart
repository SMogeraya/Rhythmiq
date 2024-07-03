import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:soul_tunes/features/authentication/screens/login/login.dart';
import 'package:soul_tunes/features/authentication/screens/onboarding.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'package:soul_tunes/features/authentication/screens/signup/verifyemail.dart';
import 'package:soul_tunes/navigationmenu.dart';
import 'package:soul_tunes/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:soul_tunes/utils/exceptions/firebase_exceptions.dart';
import 'package:soul_tunes/utils/exceptions/format_exceptions.dart';
import 'package:soul_tunes/utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  ///variables
  final devicestorage = GetStorage();
  final _auth = FirebaseAuth.instance; //WE have initialized the firebasse in main.dart here were creating the instance
 
 
  //Get Authenticated User data
  User? get authuser => _auth.currentUser;

  
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    /* if (kDebugMode) {
      print("********* Get Storage*******");
      print(devicestorage.read('isFirstTime'));
    }*/
    User? user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const OnBoardingScreen());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: user.email));
      }
    } else {
       devicestorage.writeIfNull('isFirstTime', true);
      // devicestorage.read('isFirstTime') != true
      //     ? Get.offAll(() => const LoginScreen())
      //     : Get.offAll(() => const OnBoardingScreen());
      Get.offAll(() => const OnBoardingScreen());
    }
  }

  /*------------------------ Email & Password Signin----------------------*/
  ///[Email Authentication]-signup
  Future<UserCredential> loginwithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  ///[Email Authentication]-register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  ///EmailVerification

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  //Logout User
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }
}
