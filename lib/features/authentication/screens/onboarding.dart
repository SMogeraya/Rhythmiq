import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:soul_tunes/features/authentication/controllers.onboarding/boarding/onboarding_controller.dart';
import 'package:soul_tunes/utils/constants/colors.dart';
import 'package:soul_tunes/utils/constants/image_strings.dart';
import 'package:soul_tunes/utils/constants/sizes.dart';
import 'package:soul_tunes/utils/devices/device_utility.dart';
import 'package:soul_tunes/utils/helpers/helper_functions.dart';
import 'package:soul_tunes/utils/constants/text_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          ///Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                  image: SImages.onlineshopping,
                  title: STexts.onBoardingTitle1,
                  subtitle: STexts.onBoardingSubTitle1),
                   OnBoardingPage(
                  image: SImages.epayment,
                  title: STexts.onBoardingTitle2,
                  subtitle: STexts.onBoardingSubTitle2),
              OnBoardingPage(
                  image: SImages.onlinepurchase,
                  title: STexts.onBoardingTitle3,
                  subtitle: STexts.onBoardingSubTitle3),
             
            ],
          ),

          //Skip Button
          const Skip(),

          //Dot navigation
          const Dotnav(),

          const ArrowButton(),
        ],
      ),
    );
  }
}

class ArrowButton extends StatelessWidget {
  const ArrowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Positioned(
      right: SSizes.defaultSpace,
      bottom: SDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: dark ? Colors.purple[200] : Colors.black),
        onPressed: () {
          OnBoardingController.instance.nextPage();
        },
        child: const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}

class Dotnav extends StatelessWidget {
  const Dotnav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = SHelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: SDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: SSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect: ExpandingDotsEffect(
            activeDotColor: dark ? SColors.light : Colors.black, dotHeight: 6),
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle});

  final String image, title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(SSizes.defaultSpace),
      child: Column(
        children: [
          Image(
            width: SHelperFunctions.screenWidth() * 0.8,
            height: SHelperFunctions.screenHeight() * 0.6,
            image: AssetImage(image),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: SSizes.spaceBtwItems),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class Skip extends StatelessWidget {
  const Skip({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Positioned(
      top: SDeviceUtils.getAppBarHeight(),
      right: SSizes.defaultSpace,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: dark ? SColors.primary : Colors.black),
        onPressed: () {
          OnBoardingController.instance.skipPage();
        },
        child: const Text('Skip'),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:soul_tunes/features/authentication/controllers.onboarding/boarding/SCircularIcon.dart';
import 'package:soul_tunes/features/authentication/controllers.onboarding/boarding/onboarding_controller.dart';
import 'package:soul_tunes/utils/constants/colors.dart';
import 'package:soul_tunes/utils/constants/image_strings.dart';
import 'package:soul_tunes/utils/constants/sizes.dart';
import 'package:soul_tunes/utils/devices/device_utility.dart';
import 'package:soul_tunes/utils/helpers/helper_functions.dart';
import 'package:soul_tunes/utils/constants/text_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          ///Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                  image: SImages.onBoardingImg1,
                  title: STexts.onBoardingTitle1,
                  subtitle: STexts.onBoardingSubTitle1),
              OnBoardingPage(
                  image: SImages.onBoardingImg3,
                  title: STexts.onBoardingTitle3,
                  subtitle: STexts.onBoardingSubTitle3),
              OnBoardingPage(
                  image: SImages.onBoardingImg2,
                  title: STexts.onBoardingTitle2,
                  subtitle: STexts.onBoardingSubTitle2),
            ],
          ),

          //Skip Button
          const Skip(),

          //Dot navigation
          const Dotnav(),

          const ArrowButton(icon: Iconsax.arrow_right_3,),
        ],
      ),
    );
  }
}



class Dotnav extends StatelessWidget {
  const Dotnav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = SHelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: SDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: SSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect: ExpandingDotsEffect(
            activeDotColor: dark ? SColors.light :  Colors.black, dotHeight: 6),
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle});

  final String image, title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(SSizes.defaultSpace),
      child: Column(
        children: [
          Image(
            width: SHelperFunctions.screenWidth() * 0.8,
            height: SHelperFunctions.screenHeight() * 0.6,
            image: AssetImage(image),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: SSizes.spaceBtwItems),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class Skip extends StatelessWidget {
  const Skip({super.key});

  @override
  Widget build(BuildContext context) {
       final dark = SHelperFunctions.isDarkMode(context);
    return Positioned(
      top: SDeviceUtils.getAppBarHeight(),
      right: SSizes.defaultSpace,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: dark ? SColors.primary: Colors.black),
        onPressed: () {
                    OnBoardingController.instance.skipPage();

        },
        child: const Text('Skip'),
      ),
    );
  }
}
*/