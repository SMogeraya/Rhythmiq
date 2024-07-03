import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soul_tunes/utils/constants/image_strings.dart';
import 'package:soul_tunes/utils/constants/sizes.dart';
import 'package:soul_tunes/utils/constants/text_strings.dart';
import 'package:soul_tunes/utils/helpers/helper_functions.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.clear)),

        ],
      ),
      body:  SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(SSizes.defaultSpace),
        child: Column(
          children: [
          Image(
                image:  const AssetImage(SImages.deliveredEmailIllustrations),
                width: SHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(
                height: SSizes.spaceBtwSections,
              ),

              //title and subtitle

              Text(
                STexts.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: SSizes.spaceBtwItems,
              ),

              Text(
                STexts.changeYourPasswordSubTitle,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: SSizes.spaceBtwItems,
              ),
                            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: (){},
                    child: const Text(STexts.done)),
              ),
              const SizedBox(
                height: SSizes.spaceBtwItems,
              ),
                           SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: (){},
                    child: const Text('Reset Email')),
              ),
          ],
        ),
        ),

      ),
    );
  }
}