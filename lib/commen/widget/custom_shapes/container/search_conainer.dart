import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:soul_tunes/utils/constants/colors.dart';
import 'package:soul_tunes/utils/constants/sizes.dart';
import 'package:soul_tunes/utils/devices/device_utility.dart';
import 'package:soul_tunes/utils/helpers/helper_functions.dart';

class SearchControllers extends StatelessWidget {
  const SearchControllers({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground =true,
    this.showBorder =true,
  });
  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SSizes.defaultSpace,vertical: SSizes.defaultSpace*3.4),
      child: Container(
        width: SDeviceUtils.getScreenWidth(context),
        padding: const EdgeInsets.all(SSizes.md),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SSizes.cardRadiusLg),
          border: showBorder?Border.all(
            color:showBackground?dark? SColors.dark: SColors.light: Colors.transparent,
          ):null,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: SColors.darkGrey,
            ),
            const SizedBox(width: SSizes.spaceBtwItems),
            Text(
              text,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
