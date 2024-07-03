import 'package:flutter/material.dart';

class Ratings extends StatelessWidget {
  const Ratings({
    super.key, required this.ratings,
  });

  final String ratings;
  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(text: ratings, style: Theme.of(context).textTheme.bodyLarge),
      const TextSpan(text: "(12)"),
    ]));
  }
}
