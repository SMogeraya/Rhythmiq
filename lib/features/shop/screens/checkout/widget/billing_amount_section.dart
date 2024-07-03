import 'package:flutter/material.dart';
import 'package:soul_tunes/utils/constants/sizes.dart';

class SBillingAmountSection extends StatelessWidget {
  const SBillingAmountSection({super.key, required this.finalprice,  });

  final int finalprice;
  final int tax = 23;
  final int shipping = 25;

  @override
  Widget build(BuildContext context) {
     final int total =finalprice + tax + shipping;
    return Column(
      children: [
        //SubTotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'SubTotal',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '$finalprice',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        const SizedBox(
          height: SSizes.spaceBtwItems / 2,
        ),
        //Shipping fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Shipping Fee',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '$shipping',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        //Tax fee
        const SizedBox(
          height: SSizes.spaceBtwItems / 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tax Fee',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '$tax',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        const SizedBox(
          height: SSizes.spaceBtwItems / 2,
        ),
        //Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total',
              style: Theme.of(context).textTheme.titleMedium,
            ),
           
            Text(
             '$total',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(
          height: SSizes.spaceBtwItems / 2,
        ),
      ],
    );
  }
}
