import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:soul_tunes/utils/constants/colors.dart';
import 'package:soul_tunes/utils/constants/sizes.dart';

class TAnimationLoaderWidget extends StatelessWidget {
  //Default constructor for the app
  //parameters
  ///text =text below animation
  ///animation=path of animation file
  ///showaction=whethher to show an action button below the text
  ///actiontext text to be displayed o the cation button
  ///onactionpressed callback function to be executec when action butto is pressed

  const TAnimationLoaderWidget(
      {super.key,
      required this.text,
      required this.animation,
      this.showaction = false,
      this.actionText,
      this.onActionPressed});
  final String text;
  final String animation;
  final bool showaction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation,
              width: MediaQuery.of(context).size.width * 0.8),
          const SizedBox(height: SSizes.defaultSpace),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: SSizes.defaultSpace),
          showaction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                    onPressed: onActionPressed,
                    style:
                        OutlinedButton.styleFrom(backgroundColor: SColors.dark),
                    child: Text(
                      actionText!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: SColors.light),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
