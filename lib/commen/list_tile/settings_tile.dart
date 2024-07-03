import 'package:flutter/material.dart';
import 'package:soul_tunes/utils/constants/colors.dart';

class SettingsMenuTile extends StatelessWidget {
  const SettingsMenuTile(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      this.trailing,
      this.onTap});

  final IconData image;
  final String title, subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        image,
        size: 29,
        color: SColors.primary,
      ),
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: const Color.fromARGB(255, 2, 0, 0)),
      ),
      subtitle: Text(
        subtitle,
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: const Color.fromARGB(255, 0, 0, 0)),
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
