import 'package:flutter/material.dart';
import 'package:soul_tunes/utils/constants/colors.dart';
import 'package:soul_tunes/utils/constants/sizes.dart';

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer(
      {super.key,
       this.width,
       this.height,
       this.radius = SSizes.cardRadiusLg,
      this.child,
       this.showBorder =false,
       this.backgroundColor =SColors.white,
       this.borderColor =SColors.borderPrimary,
      this.padding,
      this.margin});

  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color backgroundColor;
  final Color borderColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
