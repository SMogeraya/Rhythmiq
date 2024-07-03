import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:soul_tunes/commen/widget/success_screen/success_screen.dart';
import 'package:soul_tunes/data/repositories/authentication.dart';
import 'package:soul_tunes/features/authentication/controllers.onboarding/signup/verify_controller.dart';
import 'package:soul_tunes/features/authentication/screens/signup/signup.dart';
//import 'package:soul_tunes/features/authentication/screens/login/login.dart';
import 'package:soul_tunes/utils/constants/image_strings.dart';
import 'package:soul_tunes/utils/constants/sizes.dart';
import 'package:soul_tunes/utils/constants/text_strings.dart';
import 'package:soul_tunes/utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: ()=>Get.to(()=> SignUpScreen()),
              icon: const Icon(CupertinoIcons.clear)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            children: [
              Image(
                image: const AssetImage(SImages.deliveredEmailIllustrations),
                width: SHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(
                height: SSizes.spaceBtwSections,
              ),

              //title and subtitle

              Text(
                STexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: SSizes.spaceBtwItems,
              ),

              Text(
                email ?? " ", //if null display " " else email
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: SSizes.spaceBtwItems,
              ),

              Text(
                STexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: SSizes.spaceBtwItems,
              ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.checkEmailVerificationStatus(),
                    child: const Text(STexts.tContinue)),
              ),
              const SizedBox(
                height: SSizes.spaceBtwItems,
              ),

              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () => controller.sendEmailVerification(),
                    child: const Text(STexts.resendEmail)),
              ),
              const SizedBox(
                height: SSizes.spaceBtwItems,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
