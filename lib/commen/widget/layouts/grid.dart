import 'package:flutter/material.dart';
import 'package:soul_tunes/utils/constants/image_strings.dart';
import 'package:soul_tunes/utils/constants/sizes.dart';

class Gridnew extends StatelessWidget {
  Gridnew({
    super.key,
    required this.itemBuilder, required this.gridMap,
  });

  // final List<Map<String, dynamic>> gridMap = [
  //   {
  //     "title": "Yamaha Guitar",
  //     "price": "2000 Rs",
  //     "images": SImages.guitar2,
  //   },
  //   {
  //     "title": "Yamaha Flute",
  //     "price": "1890 Rs",
  //     "images": SImages.flute,
  //   },
  //   {
  //     "title": "Yamaha Violin",
  //     "price": "6000 Rs",
  //     "images": SImages.guiter,
  //   },
  //   {
  //     "title": "Guitar 2",
  //     "price": "6000 Rs",
  //     "images": SImages.guitar2,
  //   },
  //   {
  //     "title": "clariet1",
  //     "price": "6000 Rs",
  //     "images": SImages.clariet1,
  //   },
  //     {
  //     "title": "flute1",
  //     "price": "2000 Rs",
  //     "images": SImages.flute1,
  //   },
  //   {
  //     "title": "flute2",
  //     "price": "1890 Rs",
  //     "images": SImages.flute2,
  //   },
  //   {
  //     "title": "flute3",
  //     "price": "6000 Rs",
  //     "images": SImages.flute3,
  //   },
  //   {
  //     "title": "guitarLight",
  //     "price": "6000 Rs",
  //     "images": SImages.guitarLight,
  //   },
  //   {
  //     "title": "guitar1",
  //     "price": "6000 Rs",
  //     "images": SImages.guitar1,
  //   },
  //     {
  //     "title": "guitar3",
  //     "price": "2000 Rs",
  //     "images": SImages.guitar3,
  //   },
  //   {
  //     "title": "guitar4",
  //     "price": "1890 Rs",
  //     "images": SImages.guitar4,
  //   },
  //   {
  //     "title": "guitar5",
  //     "price": "6000 Rs",
  //     "images": SImages.guitar5,
  //   },
  //   {
  //     "title": "guitar6",
  //     "price": "6000 Rs",
  //     "images": SImages.guitar6,
  //   },
  //   {
  //     "title": "guitar7",
  //     "price": "6000 Rs",
  //     "images": SImages.guitar_1,
  //   },
  //     {
  //     "title": "mandolin_1",
  //     "price": "2000 Rs",
  //     "images": SImages.mandolin_1,
  //   },
  //   {
  //     "title": "mandolin_2",
  //     "price": "1890 Rs",
  //     "images": SImages.mandolin_2,
  //   },
  //   {
  //     "title": "mandolin_3",
  //     "price": "6000 Rs",
  //     "images": SImages.mandolin_3,
  //   },
  //   {
  //     "title": "saxophoneVertical",
  //     "price": "6000 Rs",
  //     "images": SImages.saxophoneVertical,
  //   },
  //   {
  //     "title": "saxophone2",
  //     "price": "6000 Rs",
  //     "images": SImages.saxophone2,
  //   },
  //     {
  //     "title": "saxophone3",
  //     "price": "2000 Rs",
  //     "images": SImages.saxophone3,
  //   },
  //   {
  //     "title": "violin1",
  //     "price": "1890 Rs",
  //     "images": SImages.violin1,
  //   },
  //   {
  //     "title": "violin2",
  //     "price": "6000 Rs",
  //     "images": SImages.violin2,
  //   },

  // ];

  final Widget? Function(BuildContext, int) itemBuilder;
  final List<Map<String, dynamic>> gridMap;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: gridMap.length,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: SSizes.gridViewSpacing,
          crossAxisSpacing: SSizes.gridViewSpacing,
          mainAxisExtent: 288,
        ),
        itemBuilder: itemBuilder);
  }
}
