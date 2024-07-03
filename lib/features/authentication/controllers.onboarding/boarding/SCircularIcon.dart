import 'package:flutter/material.dart';
import 'package:soul_tunes/features/authentication/controllers.onboarding/boarding/onboarding_controller.dart';
import 'package:soul_tunes/utils/constants/colors.dart';
import 'package:soul_tunes/utils/constants/sizes.dart';
import 'package:soul_tunes/utils/devices/device_utility.dart';
import 'package:soul_tunes/utils/helpers/helper_functions.dart';

class CircularButton extends StatelessWidget {
  const CircularButton({
    super.key, required this.icon,
  });
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Positioned(
      right: SSizes.defaultSpace,
      bottom: SDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: dark ? SColors.primary : Colors.black),
        onPressed: () {
          OnBoardingController.instance.nextPage();
        },
        child:  Icon(icon),
      ),
    );
  }
}
