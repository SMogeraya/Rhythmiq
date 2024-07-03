import 'package:flutter/material.dart';
import 'package:soul_tunes/utils/constants/sizes.dart';

class SGridView extends StatelessWidget {
  const SGridView({
    super.key,
    required this.itmCount,
    required this.mainAxisExtent,
    required this.itemBuilder,
  });
  final int itmCount;
  final double mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: itmCount,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: SSizes.gridViewSpacing,
          crossAxisSpacing: SSizes.gridViewSpacing,
          mainAxisExtent: mainAxisExtent,
        ),
        itemBuilder: itemBuilder);
  }
}
