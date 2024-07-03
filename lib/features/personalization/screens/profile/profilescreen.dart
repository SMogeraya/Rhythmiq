import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:soul_tunes/commen/widget/custom_shapes/appbar/appbar.dart';
import 'package:soul_tunes/commen/widget/images/s_rounded_image.dart';
import 'package:soul_tunes/commen/widget/texts/ssection_hedaing.dart';
import 'package:soul_tunes/features/personalization/controllers/user_controller.dart';
import 'package:soul_tunes/features/personalization/screens/profile/widget/profile_menu.dart';
import 'package:soul_tunes/utils/constants/image_strings.dart';
import 'package:soul_tunes/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const SAppBar(
        title: Text("Profile"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            children: [
              
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    //Imageee
                    const Scroller(
                      imageUrl: SImages.user,
                      width: 70,
                      height: 70,
                      borderRadius: 60,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text("Change Your Name")),
                  ],
                ),
              ),
              //Detailss

              const SizedBox(
                height: SSizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(height: SSizes.spaceBtwItems),
              const SectionHeading(
                title: "Profile Information",
                showActionButton: false, showicon: false,
              ),
              const SizedBox(height: SSizes.spaceBtwItems/1.5),

              Profile_menu(
                title: 'Name',
                value: controller.user.value.fullName,
                OnPressed: () {},
                icon: Iconsax.user4,
              ),
              Profile_menu(
                title: 'UserName',
                value: controller.user.value.username,
                OnPressed: () {},
                icon: Iconsax.user4,
              ),
              const SizedBox(
                height: SSizes.spaceBtwItems / 5,
              ),
              const Divider(),
              const SizedBox(height: SSizes.spaceBtwItems),
              const SectionHeading(
                title: "Personal Information",
                showActionButton: false,
                showicon: false,
              ),
              const SizedBox(height: SSizes.spaceBtwItems/1.5),

              Profile_menu(
                title: 'User ID',
                value: controller.user.value.id,
                OnPressed: () {},
                icon: Iconsax.user_edit,
              ),
              Profile_menu(
                title: 'Email',
                value: controller.user.value.email,
                OnPressed: () {},
                icon: Iconsax.direct,
              ),
              Profile_menu(
                title: 'Phone Number',
                value: controller.user.value.phoneNumber,
                OnPressed: () {},
                icon: Iconsax.call,
              ),
              Profile_menu(
                title: 'Gender',
                value: 'Female',
                OnPressed: () {},
                icon: Iconsax.user3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
