import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:soul_tunes/features/authentication/controllers.onboarding/signup/signup_controller.dart';
import 'package:soul_tunes/utils/constants/colors.dart';
import 'package:soul_tunes/utils/constants/image_strings.dart';
import 'package:soul_tunes/utils/constants/sizes.dart';
import 'package:soul_tunes/utils/constants/text_strings.dart';
import 'package:soul_tunes/utils/helpers/helper_functions.dart';
import 'package:soul_tunes/utils/validation/validation.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    final controller = Get.put(SignupController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            children: [
              ///title
              Text(
                STexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              ///Form
              const SizedBox(
                height: SSizes.spaceBtwSections,
              ),
              Form(
                  key: controller.signupFormKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ///First name
                          Expanded(
                            child: TextFormField(
                              controller: controller.firstname,
                              validator: (value){ if (value == null || value.isEmpty) {
      return 'Name is required.';
    }
    return null;},
                              expands: false,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Iconsax.user),
                                labelText: STexts.firstName,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: SSizes.spaceBteInputFields,
                          ),

                          //Last Name
                          Expanded(
                            child: TextFormField(
                              controller: controller.lastname,
                              validator: (value) =>TValidator.validateEmptyText('Last name', value),
                                      
                              decoration: const InputDecoration(
                                labelText: STexts.lastName,
                                prefixIcon: Icon(Iconsax.user),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: SSizes.spaceBtwSections,
                      ),

                      ///username
                      TextFormField(
                        controller: controller.username,
                        validator: (value) => TValidator.validateEmptyText('User name', value),
                        decoration: const InputDecoration(
                          labelText: STexts.username,
                          prefixIcon: Icon(Iconsax.user_edit),
                        ),
                      ),
                      const SizedBox(
                        height: SSizes.spaceBtwSections,
                      ),

                      ///Email
                      TextFormField(
                        controller: controller.email,
                        validator: (value) => TValidator.validateEmail(value),
                        decoration: const InputDecoration(
                          labelText: STexts.email,
                          prefixIcon: Icon(Iconsax.direct),
                        ),
                      ),
                      const SizedBox(
                        height: SSizes.spaceBtwSections,
                      ),

                      ///Ph Number
                      TextFormField(
                        controller: controller.phonenumber,
                        validator: (value) =>
                            TValidator.validatePhoneNumber(value),
                        decoration: const InputDecoration(
                          labelText: STexts.phoneNo,
                          prefixIcon: Icon(Iconsax.call),
                        ),
                      ),
                      const SizedBox(
                        height: SSizes.spaceBtwSections,
                      ),

                      //Password
                      Obx(
                        () => TextFormField(
                          controller: controller.password,
                          validator: (value) =>
                              TValidator.validatePassword(value),
                          obscureText: controller.hidePassword.value,
                          decoration: InputDecoration(
                              labelText: STexts.password,
                              prefixIcon: Icon(Iconsax.password_check),
                              suffixIcon: IconButton(
                                onPressed: () => controller.hidePassword.value =
                                    !controller.hidePassword.value,
                                icon: controller.hidePassword.value
                                    ? Icon(Iconsax.eye_slash)
                                    : Icon(Iconsax.eye),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: SSizes.spaceBtwSections,
                      ),




                      //address
                      TextFormField(
                        controller: controller.address,
                        validator: (value) =>  TValidator.validateEmptyText('Address', value),
                        decoration: const InputDecoration(
                          labelText:"Your Address",
                          prefixIcon: Icon(Iconsax.direct),
                        ),
                      ),
                        const SizedBox(
                        height: SSizes.spaceBtwSections/2,
                      ),
                      TextFormField(
                        controller: controller.city,
                        validator: (value) =>  TValidator.validateEmptyText('City', value),
                        decoration: const InputDecoration(
                          labelText: "City",
                          prefixIcon: Icon(Iconsax.direct),
                        ),
                      ),
                        const SizedBox(
                        height: SSizes.spaceBtwSections/2,
                      ),
                      TextFormField(
                        controller: controller.state,
                        validator: (value) =>  TValidator.validateEmptyText('State', value),
                        decoration: const InputDecoration(
                          labelText: "State",
                          prefixIcon: Icon(Iconsax.direct),
                        ),
                      ),
                        const SizedBox(
                        height: SSizes.spaceBtwSections/2,
                      ),
                      TextFormField(
                        controller: controller.country,
                        validator: (value) =>  TValidator.validateEmptyText('Country', value),
                        decoration: const InputDecoration(
                          labelText: "Country",
                          prefixIcon: Icon(Iconsax.direct),
                        ),
                      ),
                          const SizedBox(
                        height: SSizes.spaceBtwSections/2,
                      ),
                      ///Terms and conditions CheckBox
                      Row(
                        children: [
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: Obx(
                              () => Checkbox(
                                value: controller.privacypolicy.value,
                                onChanged: (value) {
                                  controller.privacypolicy.value =
                                      !controller.privacypolicy.value;
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: SSizes.spaceBtwItems,
                          ),
                          Text.rich(
                            TextSpan(children: [
                              TextSpan(
                                text: '${STexts.iAgreeTo} ',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              TextSpan(
                                text: STexts.privacyPolicy,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .apply(
                                        color: dark
                                            ? SColors.white
                                            : SColors.black,
                                        decoration: TextDecoration.underline,
                                        decorationColor: dark
                                            ? SColors.white
                                            : SColors.black),
                              ),
                              TextSpan(
                                  text: ' ${STexts.and}\n ',
                                  style: Theme.of(context).textTheme.bodySmall),
                              TextSpan(
                                text: STexts.termsOfUse,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .apply(
                                        color: dark
                                            ? SColors.white
                                            : SColors.black,
                                        decoration: TextDecoration.underline,
                                        decorationColor: dark
                                            ? SColors.white
                                            : SColors.black),
                              ),
                            ]),
                          )
                        ],
                      ),

                      ///Create account
                      const SizedBox(
                        height: SSizes.defaultSpace,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => controller.signup(),
                          child: const Text(STexts.createAccount),
                        ),
                      ),
                      const SizedBox(
                        height: SSizes.defaultSpace,
                      ),
                      //Service providers
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

                          //facebook C:\Users\jagadeeshbhat\OneDrive\Desktop\soul_tunes\lib\features\authentication\screens\signup\signup.dart
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
                          const SizedBox(
                            width: SSizes.spaceBtwItems,
                          ),
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

/*

import 'package:intl/intl.dart';

class SFormatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date); // Customize the date format as needed
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount); // Customize the currency locale and symbol as needed
  }

  static String formatPhoneNumber(String phoneNumber) {
    // Assuming a 10-digit US phone number format: (123) 456-7890
    if (phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)}';
    } else if (phoneNumber.length == 11) {
      return '(${phoneNumber.substring(0, 4)}) ${phoneNumber.substring(4, 7)} ${phoneNumber.substring(7)}';
    }
    // Add more custom phone number formatting logic for different formats if needed.
    return phoneNumber;
  }


  // Not fully tested.
  static String internationalFormatPhoneNumber(String phoneNumber) {
    // Remove any non-digit characters from the phone number
    var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // Extract the country code from the digitsOnly
    String countryCode = '+${digitsOnly.substring(0, 2)}';
    digitsOnly = digitsOnly.substring(2);

    // Add the remaining digits with proper formatting
    final formattedNumber = StringBuffer();
    formattedNumber.write('($countryCode) ');

    int i = 0;
    while (i < digitsOnly.length) {
      int groupLength = 2;
      if (i == 0 && countryCode == '+1') {
        groupLength = 3;
      }

      int end = i + groupLength;
      formattedNumber.write(digitsOnly.substring(i, end));

      if (end < digitsOnly.length) {
        formattedNumber.write(' ');
      }
      i = end;
    }

    return formattedNumber.toString();
  }




}
*/

/*
*
*
* */
