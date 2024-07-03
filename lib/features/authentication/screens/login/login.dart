import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:soul_tunes/commen/styles/spacing_styles.dart';
import 'package:soul_tunes/features/authentication/controllers.onboarding/login/login_controller.dart';
import 'package:soul_tunes/features/authentication/screens/password_config/forgot_password.dart';
import 'package:soul_tunes/features/authentication/screens/signup/signup.dart';
import 'package:soul_tunes/navigationmenu.dart';
import 'package:soul_tunes/utils/constants/colors.dart';
import 'package:soul_tunes/utils/constants/image_strings.dart';
import 'package:soul_tunes/utils/constants/sizes.dart';
import 'package:soul_tunes/utils/constants/text_strings.dart';
import 'package:soul_tunes/utils/helpers/helper_functions.dart';
import 'package:soul_tunes/utils/validation/validation.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key,  this.dark1,
     this.image,
     this.title,
     this.saleprice,
     this.finalprice,
     this.brand,
     this.discount,
     this.ratings,
     this.index,
  });

  final bool? dark1;
  final String?image;
  final String? title;
  final String? saleprice;
  final int? finalprice;
  final String? brand;
  final String? discount;
  final String? ratings;
  final int? index;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController(
        image: image?? '',
        title: title?? '',
        saleprice: saleprice?? '',
        finalprice: finalprice?? 0,
        brand: brand?? '',
        discount: discount?? '',
        ratings: ratings?? '',
        index: index?? 0, dark1: dark1?? false));
    final dark = SHelperFunctions.isDarkMode(context);

    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
          padding: SSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              ///Logo Title SubTitle
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    width: 300,
                    height: 140,
                    image: AssetImage(dark ? SImages.light : SImages.dark),
                  ),
                  Text(
                    STexts.loginTitle,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(
                    height: SSizes.sm,
                  ),
                  Text(STexts.loginSubTitle,
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),

              ///Form
              Form(
                  key: controller.loginFormKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: SSizes.spaceBtwSections,
                    ),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controller.email,
                          validator: (value) => TValidator.validateEmail(value),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Iconsax.direct_right),
                            labelText: STexts.email,
                            labelStyle: dark
                                ? const TextStyle()
                                    .copyWith(color: Colors.white)
                                : const TextStyle()
                                    .copyWith(color: Colors.black),
                          ),
                        ),
                        const SizedBox(
                          height: SSizes.spaceBteInputFields,
                        ),
                        //password
                        Obx(
                          () => TextFormField(
                            controller: controller.password,
                            validator: (value) =>
                                TValidator.validateEmptyText("Password", value),
                            obscureText: controller.hidepassword.value,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Iconsax.password_check),
                                labelText: STexts.password,
                                labelStyle: dark
                                    ? const TextStyle()
                                        .copyWith(color: Colors.white)
                                    : const TextStyle()
                                        .copyWith(color: Colors.black),
                                suffixIcon: IconButton(
                                  onPressed: () => controller.hidepassword
                                      .value = !controller.hidepassword.value,
                                  icon: Icon(controller.hidepassword.value
                                      ? Iconsax.eye_slash
                                      : Iconsax.eye),
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: SSizes.spaceBteInputFields ,
                        ),

                        //Remember me and forget password

                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Row(children: [
                        //       Obx(
                        //         ()=> Checkbox(
                        //           value: controller.rememberme.value,
                        //           onChanged: (value) =>
                        //             controller.rememberme.value =
                        //                 !controller.rememberme.value,
                                
                        //         ),
                        //       ),
                        //       const Text(STexts.rememberMe),
                        //     ]),
                        //     //Forgot password
                        //     TextButton(
                        //         onPressed: () =>
                        //             Get.to(() => const ForgotPassword()),
                        //         child: const Text(STexts.forgetPassword)),
                        //   ],
                        // ),

                        ///SignIn Button
                        const SizedBox(
                          height: SSizes.spaceBteInputFields,
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () =>
                                    controller.emailAndPasswordSignIn(),
                                child: const Text(STexts.signIn))),

                        ///Create account
                        const SizedBox(
                          height: SSizes.spaceBtwItems,
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                                onPressed: () =>
                                    Get.to(() => const SignUpScreen()),
                                child: const Text(STexts.createAccount))),
                      ],
                    ),
                  )),
              // Row(
              //   children: [
              //     Flexible(
              //         child: Divider(
              //       color: dark ? SColors.darkGrey : SColors.grey,
              //       thickness: 0.5,
              //       indent: 60,
              //       endIndent: 5,
              //     )),
              //     Text(
              //       STexts.orSignInWith.capitalize!,
              //       style: Theme.of(context).textTheme.labelMedium,
              //     ),
              //     Flexible(
              //         child: Divider(
              //       color: dark ? SColors.darkGrey : SColors.grey,
              //       thickness: 0.5,
              //       indent: 5,
              //       endIndent: 60,
              //     )),
              //   ],
              // ),

              const SizedBox(
                height: SSizes.spaceBteInputFields / 2,
              ),
              //Footer

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Container(
                  //   decoration: BoxDecoration(
                  //       border: Border.all(color: SColors.grey),
                  //       borderRadius: BorderRadius.circular(100)),
                  //   child: IconButton(
                  //     onPressed: () {},
                  //     icon: const Image(
                  //       image: AssetImage(SImages.google),
                  //       width: 23,
                  //       height: 23,
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   width: SSizes.spaceBtwItems,
                  // ),

                  //facebook
                  // Container(
                  //   decoration: BoxDecoration(
                  //       border: Border.all(color: SColors.grey),
                  //       borderRadius: BorderRadius.circular(100)),
                  //   child: IconButton(
                  //     onPressed: () {},
                  //     icon: const Image(
                  //       image: AssetImage(SImages.facebook),
                  //       width: 23,
                  //       height: 23,
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   width: SSizes.spaceBtwItems,
                  // ),
                ],
              )
            ],
          )),
    ));
  }
}
