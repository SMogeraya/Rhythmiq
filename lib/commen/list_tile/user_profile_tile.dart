import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soul_tunes/commen/widget/images/s_rounded_image.dart';
import 'package:soul_tunes/features/personalization/controllers/user_controller.dart';
import 'package:soul_tunes/features/personalization/screens/profile/profilescreen.dart';
import 'package:soul_tunes/utils/constants/image_strings.dart';
import 'package:soul_tunes/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';

class SUserProfileTile extends StatelessWidget {
  const SUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: const Scroller(
        imageUrl: SImages.user,
        width: 50,
        height: 50,
        borderRadius: 50,
      ),
      title: Text(
       controller.user.value.fullName,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: SColors.white),
      ),
      subtitle: Text(
        controller.user.value.email,
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: SColors.white),
      ),
      // trailing: IconButton(
      //     onPressed: () => Get.to(() => const ProfileScreen()),
      //     icon: const Icon(
      //       Iconsax.edit,
      //       color: SColors.white,
      //     )),
    );
  }
}
