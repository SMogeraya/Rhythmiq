import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:soul_tunes/commen/widget/custom_shapes/appbar/appbar.dart';
import 'package:soul_tunes/commen/widget/products/cart/coupon.dart';
import 'package:soul_tunes/commen/widget/products/product_cards/tRoundedContainer.dart';
import 'package:soul_tunes/commen/widget/success_screen/success_screen.dart';
import 'package:soul_tunes/features/personalization/controllers/user_controller.dart';
import 'package:soul_tunes/features/shop/screens/checkout/widget/billing_amount_section.dart';
import 'package:soul_tunes/features/shop/screens/checkout/widget/billing_payment_section.dart';
import 'package:soul_tunes/features/shop/screens/home/home.dart';
import 'package:soul_tunes/features/shop/screens/orders/orders.dart';
import 'package:soul_tunes/navigationmenu.dart';
import 'package:soul_tunes/utils/constants/colors.dart';
import 'package:soul_tunes/utils/constants/image_strings.dart';
import 'package:soul_tunes/utils/constants/sizes.dart';
import 'package:soul_tunes/utils/helpers/helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen(
      {super.key,
      required this.finalprice,
      required this.image,
      required this.title,
      required this.discount,
      required this.ratings,
      required this.saleprice,
      required this.brand,
      required this.index,
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
    final controller = Get.put(UserController());
    return Scaffold(
      appBar: SAppBar(
        title: Text(
          "Order Review",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(SSizes.defaultSpace),
        child: Column(
          children: [
            ////--Coupon Text Field
            Coupon(dark: dark),
            const SizedBox(
              height: SSizes.spaceBtwItems,
            ),

            ///--Billing SEction
            TRoundedContainer(
              padding: const EdgeInsets.all(SSizes.md),
              showBorder: true,
              backgroundColor: dark ? SColors.dark : SColors.white,
              child: Column(children: [
                ///Pricing
                SBillingAmountSection(
                  finalprice: finalprice,
                ),
                const SizedBox(
                  height: SSizes.spaceBtwItems,
                ),

                ///Divider
                const Divider(),
                const SizedBox(
                  height: SSizes.spaceBtwItems,
                ),

                ///payment
                const SBillingPaymentSection(),
                const SizedBox(
                  height: SSizes.spaceBtwItems,
                ),

                ///address
                const Divider(),
                const SizedBox(
                  height: SSizes.spaceBtwItems / 2,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Shipping Address',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: SSizes.spaceBtwItems,
                    ),
                    Row(
                      children: [
                        const Icon(Iconsax.location),
                          const SizedBox(
                         width: SSizes.spaceBtwItems / 2,
            ),
                        Text(
                          ' ' +
                              controller.user.value.address +
                              ' , ' +'\n' +
                              controller.user.value.city +
                              ' , ' +
                              
                              controller.user.value.state,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    )
                  ],
                ),
              ]),
            )
          ],
        ),
      )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(SSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => MyOrders(
                  dark: dark,
                  image: image,
                  title: title,
                  saleprice: saleprice,
                  finalprice: finalprice,
                  brand: brand,
                  discount: discount,
                  ratings: ratings,
                  index: index)

              // SuccessScreen(
              //     title: 'Payment Success',
              //     subtitle: 'Your Item will be shipped soon',
              //     image: SImages.paymentsuccess,
              //     onPressed: () => Get.offAll(() =>  HomeScreen())),
              ),
          child: const Text('Checkout'),
        ),
      ),
    );
  }
}
