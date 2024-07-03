import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:soul_tunes/features/authentication/screens/password_config/reset_password.dart';
import 'package:soul_tunes/utils/constants/sizes.dart';
import 'package:soul_tunes/utils/constants/text_strings.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body :     Padding(
        padding: const EdgeInsets.all(SSizes.defaultSpace),
        child: Column(
          children: [
            //Heading

            Text(STexts.forgetPasswordTitle,style: Theme.of(context).textTheme.headlineMedium,),
            const SizedBox(height: SSizes.spaceBtwItems,),
                 Text(STexts.forgetPasswordSubTitle,style: Theme.of(context).textTheme.labelLarge,),
            const SizedBox(height: SSizes.spaceBtwSections*2),
            //Text Field

TextFormField(
  decoration: const InputDecoration(
    labelText: STexts.email,
    prefixIcon: Icon(Iconsax.direct_right),
  ),
),
            //Submit Button
            const SizedBox(height: SSizes.spaceBtwItems *2,),
            SizedBox(width:double.infinity,child: ElevatedButton(onPressed: ()=> Get.off(()=>const ResetPassword()), child: const Text(STexts.submit))),
          ],
        ),
      )
    );
  }
}