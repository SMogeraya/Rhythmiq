import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soul_tunes/features/authentication/screens/login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  ///variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs; //change the design without stateful widget

  ///Update Current Index When page Scroll
  void updatePageIndicator(index) {
    currentPageIndex.value = index;
  }

  ///Jump to the specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    final idx = currentPageIndex.value;
    pageController.jumpToPage(idx);
  }

  ///UpdateCurrent Index & jump to next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      Get.offAll(() => const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  ///update current Index & jump to the last Page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
