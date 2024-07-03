import 'package:flutter/material.dart';
//import 'package:soul_tunes/utils/constants/image_strings.dart';

class ScrollImage extends StatelessWidget {
  const ScrollImage({
    super.key,
    required this.image,
    this.width = 50,
    this.height = 50,
    this.text = "data",  this.istext=false,
  });

  final String image;
  final double? width, height;
  final bool istext;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: width,
          height: width,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 252, 250, 250),
            borderRadius: BorderRadius.circular(50),
          ),
          child: IconButton(onPressed: () {}, icon: Image(image: AssetImage(image))),
        ),
        Text(istext ? text : " "),
      ],
    );
  }
}
