import 'package:flutter/material.dart';

class SProductTitleText extends StatelessWidget {
  const SProductTitleText(
      {super.key,
      required this.title,
       this.smallSize =false,
       this.maxlines =1,
      this.textAlign});


  final String title;
  final bool smallSize;
  final int maxlines;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return  Text(title,
    style: smallSize? Theme.of(context).textTheme.labelLarge : Theme.of(context).textTheme.titleMedium,
    overflow: TextOverflow.ellipsis,
    maxLines: maxlines,
    textAlign: textAlign,
    );
  }
}
