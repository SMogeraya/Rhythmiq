import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:soul_tunes/commen/styles/shadows.dart';
import 'package:soul_tunes/commen/widget/images/s_rounded_image.dart';
import 'package:soul_tunes/commen/widget/products/product_cards/tRoundedContainer.dart';
import 'package:soul_tunes/commen/widget/texts/product_title_text.dart';
import 'package:soul_tunes/features/authentication/screens/login/login.dart';
import 'package:soul_tunes/features/shop/screens/product_details/product_details.dart';
import 'package:soul_tunes/features/shop/screens/wishlist/wishlist.dart';
import 'package:soul_tunes/navigationmenu.dart';
import 'package:soul_tunes/utils/constants/colors.dart';
import 'package:soul_tunes/utils/constants/helper_functions.dart';
import 'package:soul_tunes/utils/constants/image_strings.dart';
import 'package:soul_tunes/utils/constants/sizes.dart';

class SProductVertical extends StatelessWidget {
  const SProductVertical(
      {super.key,
      required this.image,
      required this.title,
      required this.discount,
      required this.ratings,
      required this.saleprice,
      required this.finalprice,
      required this.brand,
      required this.index});

  final String image;
  final String title;
  final String saleprice;
  final int finalprice;
  final String brand;
  final String discount;
  final String ratings;
  final int index;
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(
            image: image,
            title: title,
            discount: discount,
            ratings: ratings,
            saleprice: saleprice,
            finalprice: finalprice,
            brand: brand,
            index:index,
          )),
      child: Container(
        width: 80,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [SShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(SSizes.productImageRadius),
          color: dark ? SColors.darkerGrey : SColors.white,
        ),
        child: Column(
          children: [
            ///ThumbNail ,wishlist,Discount tag
            TRoundedContainer(
              height: 200,
              padding: const EdgeInsets.all(SSizes.sm),
              backgroundColor: dark ? SColors.dark : SColors.light,
              child: Stack(
                ///--ThumbnailImage
                children: [
                  Center(
                    child: Scroller(
                      imageUrl: image,
                      fit: BoxFit.cover,
                      applyImageRadius: true,
                    ),
                  ),

                  /// Sale tag

                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
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
                  ),

                  ///---Favourite Icon button

                  SCircularIcon(
                      dark: dark,
                      image: image,
                      title: title,
                      saleprice: saleprice,
                      finalprice: finalprice,
                      brand: brand,
                      discount: discount,
                      ratings: ratings,
                      index: index),
                ],
              ),
            ),

            /// --Details

            Padding(
              padding: const EdgeInsets.only(left: SSizes.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SProductTitle(
                      title: 'Warming Musics', smallSize: true, maxLines: 1),
                  Row(
                    children: [
                      Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(
                        width: SSizes.xs,
                      ),
                      const Icon(Iconsax.verify5,
                          color: SColors.primary, size: SSizes.iconXs),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: SSizes.md),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$finalprice' ' Rs',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(SSizes.cardRadiusMd),
                        bottomRight: Radius.circular(SSizes.productImageRadius),
                      ),
                    ),
                    child: const SizedBox(
                      width: SSizes.iconLg * 1.2,
                      height: SSizes.iconLg * 1.2,
                      child: Center(
                        child: Icon(
                          Iconsax.add,
                          color: SColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SCircularIcon extends StatelessWidget {
  const SCircularIcon({
    super.key,
    required this.dark,
    required this.image,
    required this.title,
    required this.saleprice,
    required this.finalprice,
    required this.brand,
    required this.discount,
    required this.ratings,
    required this.index,
  });

  final bool dark;
  final String image;
  final String title;
  final String saleprice;
  final int finalprice;
  final String brand;
  final String discount;
  final String ratings;
  final int index;
  @override
  Widget build(BuildContext context) {
    NavigationMenu(
        dark: dark,
        image: image,
        title: title,
        saleprice: saleprice,
        finalprice: finalprice,
        brand: brand,
        discount: discount,
        ratings: ratings,
        index: index);

        
        LoginScreen(
        dark1: dark,
        image: image,
        title: title,
        saleprice: saleprice,
        finalprice: finalprice,
        brand: brand,
        discount: discount,
        ratings: ratings,
        index: index);
    return Positioned(
      top: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: dark
              ? SColors.black.withOpacity(0.8)
              : SColors.white.withOpacity(0.9),
        ),
        child: IconButton(
          onPressed: () => Get.to(() => FavouriteScreen(
              dark: dark,
              image: image,
              title: title,
              saleprice: saleprice,
              finalprice: finalprice,
              brand: brand,
              discount: discount,
              ratings: ratings,
              index: index)),
          icon: Icon(
            Iconsax.heart5,
            color: Colors.red[700],
          ),
        ),
      ),
    );
  }
}
