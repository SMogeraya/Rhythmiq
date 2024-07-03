import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soul_tunes/commen/widget/loader/animation_loader.dart';
import 'package:soul_tunes/utils/constants/colors.dart';
import 'package:soul_tunes/utils/helpers/helper_functions.dart';

class SFullScreenLoader {
  ///Open a full screen loader dialog with a given text and animations
  ///this method doesnt return anything
  ///
  ///parameters:
  ///  - text:the text to be displayed in the loading dialog
  ///  - animation the animation to be shown
  ///
  ///
  static void openLoadingDialog(String text, String animation) {
    showDialog(
        context: Get.overlayContext!, //for Overlay dialogs
        barrierDismissible:
            false, //dialog cant be dismissed by tapping outside it
        builder: (_) => PopScope(
              canPop: false,          //Disable poppings with the back button
              child: Container(
                color: SHelperFunctions.isDarkMode(Get.context!)
                    ? SColors.dark
                    : SColors.white,
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 250,
                    ),
                    TAnimationLoaderWidget(text: text, animation: animation),
                  ],
                ),
              ),
            ));
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop(); //Close the dialog using navigator
  }
}
