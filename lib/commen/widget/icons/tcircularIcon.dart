import 'package:flutter/material.dart';
import 'package:soul_tunes/utils/constants/colors.dart';
import 'package:soul_tunes/utils/constants/sizes.dart';
import 'package:soul_tunes/utils/helpers/helper_functions.dart';

class S_Circular_icons extends StatelessWidget {
  const S_Circular_icons({
    super.key,
    this.width,
    this.height,
    this.sizes = SSizes.lg,
    required this.icon,
    this.color,
    this.background,
    this.onPressed,
  });

  final double? width, height, sizes;
  final IconData icon;
  final Color? color;
  final Color? background;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: background != null
              ? background!
              : dark
                  ? SColors.black.withOpacity(0.9)
                  : SColors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(100)),
      child: IconButton(
        onPressed: () {},
        icon: Icon(icon),
        color: color,
      ),
    );
  }
}
