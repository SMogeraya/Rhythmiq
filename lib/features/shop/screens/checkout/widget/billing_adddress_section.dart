import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:soul_tunes/utils/constants/sizes.dart';

class SBillingAddressSEction extends StatelessWidget {
  const SBillingAddressSEction({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Shipping Address',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextButton(onPressed: () {}, child: const Text('Change')),
          ],
        ),
        const SizedBox(
          height: SSizes.spaceBtwItems / 2,
        ),
        Text(
          "Sahana M",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(
          height: SSizes.spaceBtwItems / 2,
        ),

        //Phone number

        Row(
          children: [
            const Icon(Iconsax.call5, color: Colors.grey, size: 16),
            const SizedBox(
              width: SSizes.spaceBtwItems / 2,
            ),
            Text(
              "1234567890",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),

        //Address
          Row(
          children: [
            const Icon(Iconsax.call5, color: Colors.grey, size: 16),
            const SizedBox(
              width: SSizes.spaceBtwItems / 2,
            ),
            Expanded(
              child: Text(
                "Hoskerehalli,GurudattaLayout,Banglore",
                style: Theme.of(context).textTheme.bodyMedium,
                softWrap: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
