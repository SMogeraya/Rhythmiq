import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading(
      {super.key,
      this.textColor,
      required this.title,
      this.buttonTitle = "view all",
      this.showActionButton = false,
      this.onPressed,
      required this.showicon, this.icon});

  final Color? textColor;
  final String title, buttonTitle;
  final bool showActionButton;
  final bool showicon;
  final void Function()? onPressed;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(showicon ? icon : null),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          TextButton(onPressed: onPressed, child: Text(buttonTitle))
      ],
    );
  }
}
