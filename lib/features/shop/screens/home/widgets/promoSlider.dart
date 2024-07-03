import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soul_tunes/commen/widget/custom_shapes/container/CircleContainer.dart';
import 'package:soul_tunes/commen/widget/images/s_rounded_image.dart';
import 'package:soul_tunes/features/shop/controllers/home_contrller.dart';
import 'package:soul_tunes/utils/constants/colors.dart';
import 'package:soul_tunes/utils/constants/image_strings.dart';
import 'package:soul_tunes/utils/constants/sizes.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeControler());

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1.2,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
          items: const [
            Scroller(imageUrl: SImages.yamg),
             Scroller(
              imageUrl: SImages.flute,
            ),
            Scroller(
              imageUrl: SImages.drums,
              width: 250,
            ),
           
          ],
        ),
        const SizedBox(height: SSizes.spaceBtwItems),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < 3; i++)
                  CircularContainer(
                    width: 20,
                    height: 4,
                    backgroundColor: controller.carosalCurrentIndex.value == i
                        ? SColors.primary
                        : SColors.grey,
                    margin: const EdgeInsets.only(right: 10),
                  )
              ],
            ),
          ),
        )
      ],
    );
  }
}
