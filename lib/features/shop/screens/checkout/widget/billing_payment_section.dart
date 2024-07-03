import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:soul_tunes/commen/widget/products/product_cards/tRoundedContainer.dart';
import 'package:soul_tunes/utils/constants/colors.dart';
import 'package:soul_tunes/utils/constants/image_strings.dart';
import 'package:soul_tunes/utils/constants/sizes.dart';
import 'package:soul_tunes/utils/helpers/helper_functions.dart';

class SBillingPaymentSection extends StatelessWidget {
  const SBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Payment Method',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
              const SizedBox(
          height: SSizes.spaceBtwItems / 2,
        ),
           // TextButton(onPressed: () {}, child: const Text('Change')),
          ],
        ),
        const SizedBox(
          height: SSizes.spaceBtwItems ,
        ),
        Row(
          children: [
            // TRoundedContainer(
            //   width: 60,
            //   height: 35,
            //   backgroundColor: dark ? SColors.light : SColors.dark,
            //   padding:const EdgeInsets.all(SSizes.sm),
            //   child:Image(image:AssetImage(SImages.paypal),fit: BoxFit.contain,),
              
            // ),
            Icon(Iconsax.money4),
            SizedBox(width: SSizes.spaceBtwItems/2,),
            Text('Cash On Delivery',style: Theme.of(context).textTheme.bodyLarge,),
          ],
        )
      ],
    );
  }
}
