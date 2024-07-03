import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get_storage/get_storage.dart';
import 'package:soul_tunes/commen/widget/custom_shapes/appbar/appbar.dart';
import 'package:soul_tunes/commen/widget/icons/tcircularIcon.dart';
import 'package:soul_tunes/commen/list_tile/products.dart';
import 'package:soul_tunes/commen/widget/layouts/grid_layout.dart';
import 'package:soul_tunes/commen/widget/products/product_cards/product_card_vertical.dart';
import 'package:soul_tunes/features/shop/screens/home/home.dart';
import 'package:soul_tunes/utils/constants/sizes.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({
    super.key,
    required this.dark,
    required this.image,
    required this.title,
    required this.saleprice,
    required this.finalprice,
    required this.brand,
    required this.discount,
    required this.ratings,
    required this.index,
  });

  final bool dark;
  final String image;
  final String title;
  final String saleprice;
  final int finalprice;
  final String brand;
  final String discount;
  final String ratings;
  final int index;

  @override
  Widget build(BuildContext context) {
    const gridMap = GridMaps.gridMap;
    final wish = GetStorage();
  
    var i = 0;

    GridMaps.index2.insert(GridMaps.index2.length, index);

    wish.write('wishlist', GridMaps.index2);
    final myindex = wish.read('wishlist');
    return Scaffold(
      appBar: SAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          // S_Circular_icons(
          //   icon: Iconsax.add,
          //   onPressed: () => Get.to(()=>HomeScreen()),
          // )
        ],
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SSizes.defaultSpace),
          child: Column(children: [
            SGridView(
              itmCount: GridMaps.index2.length,
              mainAxisExtent: 288,
              itemBuilder: (_, index) => SProductVertical(
                image:
                    "${gridMap.elementAt(myindex.elementAt(index))['images']}",
                title: "${gridMap.elementAt(myindex.elementAt(index))['title']}",
                discount:
                    "${gridMap.elementAt(myindex.elementAt(index))['discount']}",
                ratings:
                    "${gridMap.elementAt(myindex.elementAt(index))['ratings']}",
                saleprice:
                    "${gridMap.elementAt(myindex.elementAt(index))['saleprice']}",
                finalprice:
                    gridMap.elementAt(myindex.elementAt(index))['finalprice'],
                brand: "${gridMap.elementAt(myindex.elementAt(index))['brand']}",
                index: index,
              ),
            )
          ]),
        ),
      ),
    );
  }
}



 // List<Map<String, dynamic>> gridMap = [
    //   {
    //     image: "",
    //     title: '',
    //     saleprice: '',
    //     'finalprice': 0,
    //     brand: '',
    //     discount: '',
    //     ratings: '',
        
    //   }
    // ];
    // final Map<String, dynamic> wishlist = {
    //   'image': image,
    //   'title': title,
    //   'saleprice': saleprice,
    //   'finalprice': finalprice,
    //   'brand': brand,
    //   'discount': discount,
    //   'ratings': ratings,
    // };
    // gridMap.add( wishlist);