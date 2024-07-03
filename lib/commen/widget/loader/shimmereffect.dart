import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:soul_tunes/utils/constants/colors.dart';
import 'package:soul_tunes/utils/constants/helper_functions.dart';

class SShimmerEffect extends StatelessWidget {
  const SShimmerEffect(
      {super.key,
      required this.width,
      required this.height,
       this.radius =15,
      this.color});

  final double width, height, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: color ?? (dark ? SColors.darkerGrey : SColors.white),
            borderRadius:BorderRadius.circular(radius)),
      ),
    );
  }
}
