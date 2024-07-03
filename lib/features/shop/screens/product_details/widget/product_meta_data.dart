import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:soul_tunes/commen/widget/icons/tcircularIcon.dart';
import 'package:soul_tunes/commen/widget/products/product_cards/tRoundedContainer.dart';
import 'package:soul_tunes/features/shop/screens/home/widgets/SCircularImageSCroll.dart';
import 'package:soul_tunes/features/shop/screens/product_details/widget/product_price_text.dart';
import 'package:soul_tunes/features/shop/screens/product_details/widget/product_title_text.dart';
import 'package:soul_tunes/utils/constants/colors.dart';
import 'package:soul_tunes/utils/constants/helper_functions.dart';
import 'package:soul_tunes/utils/constants/image_strings.dart';
import 'package:soul_tunes/utils/constants/sizes.dart';

class SProductMetaData extends StatelessWidget {
  const SProductMetaData({
    super.key,
    required this.discount,
    required this.saleprice,
    required this.finalprice,
    required this.title,
    required this.brand,
  });

  final String discount;
  final String saleprice;
  final String finalprice;
  final String title;
  final String brand;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///Price & Sale Price
        Row(
          children: [
            //Sale Tag
            TRoundedContainer(
              radius: SSizes.sm,
              backgroundColor: SColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: SSizes.sm, vertical: SSizes.xs),
              child: Text(
                discount,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: SColors.black),
              ),
            ),
            const SizedBox(
              width: SSizes.spaceBtwItems / 2,
            ),
            //Price

            Text(
              saleprice,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(
              width: SSizes.spaceBtwItems / 2,
            ),

            SProductPriceText(
              price: finalprice,
            ),
          ],
        ),
        const SizedBox(height: SSizes.spaceBtwItems / 1.5),

        ///Title
        SProductTitleText(
          title: title,
        ),
        const SizedBox(
          height: SSizes.spaceBtwItems,
        ),

        ///Stock Status
        Row(
          children: [
            const SProductTitleText(
              title: 'Status:',
            ),
            const SizedBox(
              width: SSizes.spaceBtwItems / 2,
            ),
            Text(
              'In Stock',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        Row(
          children: [
            // const ScrollImage(
            //   image: SImages.guiter,
            //   width: 32,
            //   height: 32,
            // ),

            Text(
              brand,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              width: SSizes.spaceBtwItems / 2,
            ),
            const Icon(Iconsax.verify5,
                color: SColors.primary, size: SSizes.iconXs),
          ],
        ),
         const SizedBox(
                height: SSizes.spaceBtwItems / 2,
              ),
        TRoundedContainer(
          showBorder: true,
          padding: const EdgeInsets.all(SSizes.md),
          backgroundColor: dark ? SColors.dark : SColors.white,
          child: Column(
            children: [
              const Row(
                mainAxisAlignment:MainAxisAlignment.start,
                children: [
                SProductTitleText(
                  title: 'Product Details',
                ),
              ]),
              const SizedBox(
                height: SSizes.spaceBtwItems / 2,
              ),
              Text(
                'The ' +
                    title +
                    ' is a versatile and portable instrumnet  for both beginners and intermediate musicians.The instrument also includes a suite of  educational guide for users to learn, play and practice',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        )

        ///Brand
      ],
    );
  }
}
