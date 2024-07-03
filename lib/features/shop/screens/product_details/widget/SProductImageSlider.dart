import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:soul_tunes/commen/widget/custom_shapes/appbar/appbar.dart';
import 'package:soul_tunes/commen/widget/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:soul_tunes/commen/widget/icons/tcircularIcon.dart';
import 'package:soul_tunes/features/shop/screens/wishlist/wishlist.dart';
import 'package:soul_tunes/utils/constants/colors.dart';
import 'package:soul_tunes/utils/constants/image_strings.dart';
import 'package:soul_tunes/utils/constants/sizes.dart';

class SProductImageSlider extends StatelessWidget {
  const SProductImageSlider({
    super.key,
    required this.dark, required this.image,
      required this.title,
      required this.discount,
      required this.ratings,
      required this.saleprice,
      required this.finalprice,
      required this.brand,  this.index=0,
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
    return CurvedEdgeWidget(
      child: Container(
        color: dark ? SColors.darkerGrey : SColors.light,
        child:  Stack(
          children: [
            //Main Large Image
            SizedBox(
              height: 400,
              child: Padding(
                padding:const EdgeInsets.all(SSizes.productImageRadius),
                child: Center(
                  child: Image(image: AssetImage(image)),
                ),
              ),
            ),
            //Appbarr
            SAppBar(
              showBackArrow: false,
              actions: [
                 IconButton(
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
