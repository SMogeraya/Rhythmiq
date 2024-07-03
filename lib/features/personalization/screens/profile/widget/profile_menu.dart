import 'package:flutter/material.dart';
import 'package:soul_tunes/utils/constants/sizes.dart';

// ignore: camel_case_types
class Profile_menu extends StatelessWidget {
  const Profile_menu({
    super.key,
    required this.title,
    required this.value,
    required this.icon, required this.OnPressed,
  });
  final String title, value;
  final IconData? icon;
  final VoidCallback OnPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: OnPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: SSizes.defaultSpace),
        child: Row(
          children: [
            Icon(icon, size: 18),
            SizedBox(width: SSizes.spaceBtwItems/3,),
            Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                )),
            Expanded(
                flex: 5,
                child: Text(
                  value,
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                )),
           
          ],
        ),
      ),
    );
  }
}
