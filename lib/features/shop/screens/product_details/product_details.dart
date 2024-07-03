import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:soul_tunes/commen/widget/products/product_cards/tRoundedContainer.dart';
import 'package:soul_tunes/features/shop/screens/checkout/checkout.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:soul_tunes/commen/widget/custom_shapes/appbar/appbar.dart';
// import 'package:soul_tunes/commen/widget/custom_shapes/curved_edges/curved_edges_widget.dart';
// import 'package:soul_tunes/commen/widget/icons/tcircularIcon.dart';
// import 'package:soul_tunes/features/shop/screens/home/home.dart';
import 'package:soul_tunes/features/shop/screens/product_details/widget/SProductImageSlider.dart';
import 'package:soul_tunes/features/shop/screens/product_details/widget/product_meta_data.dart';
import 'package:soul_tunes/features/shop/screens/product_details/widget/ratings.dart';
import 'package:soul_tunes/utils/constants/colors.dart';
//import 'package:soul_tunes/utils/constants/colors.dart';
import 'package:soul_tunes/utils/constants/helper_functions.dart';
import 'package:soul_tunes/utils/constants/sizes.dart';
// import 'package:soul_tunes/utils/constants/image_strings.dart';
// import 'package:soul_tunes/utils/constants/sizes.dart';
import 'package:soul_tunes/commen/widget/custom_shapes/appbar/appbar.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.discount,
      required this.ratings,
      required this.saleprice,
      required this.finalprice,
      required this.brand,  this.index=0,
      });

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
    return Scaffold(
    appBar: SAppBar(
        title: Text(
          "Product Details",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          //Product Image Slider
          children: [
            SProductImageSlider(
              dark: dark,
              image: image,
                discount: discount,
                saleprice: saleprice,
                finalprice: finalprice,
                brand: brand,
                title: title,
                ratings:ratings,
                index:index,
            ),
            //Details

            Padding(
              padding: const EdgeInsets.only(
                  left: SSizes.defaultSpace,
                  bottom: SSizes.defaultSpace,
                  right: SSizes.defaultSpace),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Iconsax.star5, color: Colors.amber, size: 24),
                      const SizedBox(
                        width: SSizes.spaceBtwItems / 2,
                      ),
                      //ratings

                      Ratings(
                        ratings: ratings,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: SSizes.spaceBtwItems / 2,
                  ),

                  //details
                  TRoundedContainer(
                    showBorder: true,
                    padding: const EdgeInsets.all(SSizes.md),
                    backgroundColor: dark ? SColors.dark : SColors.white,
                    child: SProductMetaData(
                      discount: discount,
                      saleprice: saleprice,
                      finalprice: '$finalprice' ' Rs',
                      brand: brand,
                      title: title,
                    ),
                  ),
                  SizedBox(height: SSizes.spaceBtwItems),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () => Get.to(() => CheckoutScreen(
                            finalprice: finalprice,
                           
                            image: image,
                            title: title,
                            saleprice: saleprice,
                            
                            brand: brand,
                            discount: discount,
                            ratings: ratings,
                            index: index)),
                        child: const Text("Checkout")),
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
