//import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:soul_tunes/commen/list_tile/settings_tile.dart';
import 'package:soul_tunes/commen/list_tile/user_profile_tile.dart';
// import 'package:soul_tunes/commen/list_tile/user_profile_tile.dart';
import 'package:soul_tunes/commen/widget/custom_shapes/appbar/appbar.dart';
//import 'package:soul_tunes/commen/widget/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:soul_tunes/commen/widget/custom_shapes/curved_edges/primary_header_container.dart';
import 'package:soul_tunes/commen/widget/texts/ssection_hedaing.dart';
import 'package:soul_tunes/features/personalization/controllers/user_controller.dart';
import 'package:soul_tunes/features/personalization/screens/profile/widget/profile_menu.dart';
import 'package:soul_tunes/utils/constants/colors.dart';
import 'package:soul_tunes/utils/constants/sizes.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final controller = UserController.instance;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///--Header
            SPrimaryHeaderContainer(
                
                  child: Column(
                                children: [
                  SAppBar(
                    title: Text(
                      'Account',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: SColors.white),
                    ),
                  ),
                   const SizedBox(height:100,child: SUserProfileTile()),
                  
                 
                                ],
                              ),
                ),

            // --Body
             Padding(
              padding: EdgeInsets.all(SSizes.defaultSpace),
              child: Column(
                children: [
              //     SectionHeading(title: 'Account Settings',showActionButton: false, showicon: false,),
              //     SettingsMenuTile(title:"My Address" , subtitle: "Get Shopping Delivery Address", image: Iconsax.safe_home,),
              //      const SizedBox(
              //   height: SSizes.spaceBtwItems / 2,
              // ),
              // const Divider(),
              
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
              // Profile_menu(
              //   title: 'Gender',
              //   value: 'Female',
              //   OnPressed: () {},
              //   icon: Iconsax.user3,
              // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class SUserProfileTile extends StatelessWidget {
//   const SUserProfileTile({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: const ScrollImage(image: AssetImage(SImages.user)),
//       title: Text(
//         'Sahana Mogeroy',
//         style: Theme.of(context)
//             .textTheme
//             .headlineSmall!
//             .apply(color: SColors.white),
//       ),
//       subtitle: Text(
//         'Sahana@gmail.com',
//         style:
//             Theme.of(context).textTheme.bodyMedium!.apply(color: SColors.white),
//       ),
//       trailing: IconButton(
//           onPressed: () {},
//           icon: const Icon(
//             Iconsax.edit,
//             color: SColors.white,
//           )),
//     );
//   }
// }
