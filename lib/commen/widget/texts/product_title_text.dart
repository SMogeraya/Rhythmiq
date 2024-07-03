import 'package:flutter/material.dart';

class SProductTitle extends StatelessWidget {
  const SProductTitle({
    super.key,
    required this.title,
    required this.smallSize,
    required this.maxLines,
    this.textAlign,
  });

  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: smallSize
          ? Theme.of(context).textTheme.labelLarge
          : Theme.of(context).textTheme.titleSmall,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      textAlign: TextAlign.left,
    );
  }
}
