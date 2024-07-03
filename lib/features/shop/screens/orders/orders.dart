import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get_storage/get_storage.dart';
import 'package:soul_tunes/commen/widget/custom_shapes/appbar/appbar.dart';
import 'package:soul_tunes/commen/widget/icons/tcircularIcon.dart';
import 'package:soul_tunes/commen/list_tile/products.dart';
import 'package:soul_tunes/commen/widget/layouts/grid_layout.dart';
import 'package:soul_tunes/commen/widget/products/product_cards/product_card_vertical.dart';
import 'package:soul_tunes/commen/widget/success_screen/success_screen.dart';
import 'package:soul_tunes/features/shop/screens/home/home.dart';
import 'package:soul_tunes/navigationmenu.dart';
import 'package:soul_tunes/utils/constants/image_strings.dart';
import 'package:soul_tunes/utils/constants/sizes.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({
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
    final orders = GetStorage();

    var i = 0;

    GridMaps.myorders.insert(GridMaps.myorders.length, index);

    orders.write('shipping', GridMaps.myorders);
    final finalorder = orders.read('shipping');
    return Scaffold(
      appBar: SAppBar(
        title: Text(
          'My Orders',
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
              itmCount: GridMaps.myorders.length,
              mainAxisExtent: 288,
              itemBuilder: (_, index) => SProductVertical(
                image:
                    "${gridMap.elementAt(finalorder.elementAt(index))['images']}",
                title:
                    "${gridMap.elementAt(finalorder.elementAt(index))['title']}",
                discount:
                    "${gridMap.elementAt(finalorder.elementAt(index))['discount']}",
                ratings:
                    "${gridMap.elementAt(finalorder.elementAt(index))['ratings']}",
                saleprice:
                    "${gridMap.elementAt(finalorder.elementAt(index))['saleprice']}",
                finalprice: gridMap
                    .elementAt(finalorder.elementAt(index))['finalprice'],
                brand:
                    "${gridMap.elementAt(finalorder.elementAt(index))['brand']}",
                index: index,
              ),
            ),
            SizedBox(
              height: SSizes.spaceBteInputFields,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => SuccessScreen(
                    title: 'Order Successful',
                    subtitle:
                        ' Your Item will be  delivered  to\n your location soon \n',
                    image: SImages.onBoardingImg2,
                    onPressed: () => Get.offAll(() => NavigationMenu(
                        dark: dark,
                        image: image,
                        title: title,
                        saleprice: saleprice,
                        finalprice: finalprice,
                        brand: brand,
                        discount: discount,
                        ratings: ratings,
                        index: index)))),
                child: const Text('Continue'),
              ),
            ),
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