import 'package:flutter/material.dart';
import 'package:soul_tunes/commen/widget/products/product_cards/tRoundedContainer.dart';
import 'package:soul_tunes/utils/constants/colors.dart';
import 'package:soul_tunes/utils/constants/sizes.dart';

class Coupon extends StatelessWidget {
  const Coupon({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? SColors.dark : SColors.white,
      padding: const EdgeInsets.only(
          left: SSizes.md,
          right: SSizes.sm,
          top: SSizes.sm,
          bottom: SSizes.sm),
      child: Row(children: [
        Flexible(
          child: TextFormField(
            decoration: const InputDecoration(
              hintText: "Have a Promo Code? Enter Here",
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          ),
        ),
        SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  foregroundColor: dark
                      ? SColors.white.withOpacity(0.5)
                      : SColors.dark.withOpacity(0.5),
                      backgroundColor: SColors.grey.withOpacity(0.2)
                      ,side: BorderSide(color: Colors.grey.withOpacity(0.1),),),
                  
              child: const Text('Apply'),
            ))
      ]),
    );
  }
}
