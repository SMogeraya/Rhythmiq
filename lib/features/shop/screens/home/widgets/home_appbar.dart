import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:iconsax/iconsax.dart";
import "package:soul_tunes/commen/widget/custom_shapes/appbar/appbar.dart";
import "package:soul_tunes/commen/widget/loader/shimmereffect.dart";
import "package:soul_tunes/features/personalization/controllers/user_controller.dart";
import "package:soul_tunes/features/shop/screens/wishlist/fav.dart";
import "package:soul_tunes/utils/constants/colors.dart";
import "package:soul_tunes/utils/constants/sizes.dart";
import "package:soul_tunes/utils/constants/text_strings.dart";

class SHomeAppBar extends StatelessWidget {
  const SHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return SAppBar(
        title: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             const SizedBox(
          height: SSizes.spaceBtwItems / 2,
        ),
            Text(
              
              "RHYTHMIQ",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .apply(color: SColors.white),
            ),
           
           
             const SizedBox(
          height: SSizes.spaceBtwItems / 2,
        ),
            Obx(
              () {
                if (controller.profileLoading.value) {
                  return const SShimmerEffect(width: 80, height: 15, );
                }
                else{
                    return Text(

                  STexts.homeAppbarTitle + controller.user.value.fullName,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .apply(color: SColors.white),
                );
                }
                
              },
            ),
             const SizedBox(
          height: SSizes.spaceBtwItems / 2,
        ),
          ],
        ),
        actions: [
          Stack(children: [
            IconButton(
              icon: const Icon(Iconsax.bag, color: SColors.white),
              onPressed:()=> Get.to(()=>const FavScreen()),
            ),
            Positioned(
                right: 0,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: SColors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text('2',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .apply(color: SColors.white, fontSizeFactor: 0.5)),
                  ),
                ))
          ])
        ]);
        
  }
}




  