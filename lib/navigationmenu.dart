import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:soul_tunes/features/personalization/screens/settings/settings.dart';
import 'package:soul_tunes/features/shop/screens/home/home.dart';
import 'package:soul_tunes/features/shop/screens/orders/order_display.dart';
import 'package:soul_tunes/features/shop/screens/orders/orders.dart';
import 'package:soul_tunes/features/shop/screens/wishlist/fav.dart';
import 'package:soul_tunes/features/shop/screens/wishlist/wishlist.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({
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
    final controller = Get.put(NavigationController(
        dark1: dark,
        image: image,
        title: title,
        saleprice: saleprice,
        finalprice: finalprice,
        brand: brand,
        discount: discount,
        ratings: ratings,
        index: index));
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedindex.value,
            onDestinationSelected: (index) =>
                controller.selectedindex.value = index,
            destinations: const [
              NavigationDestination(icon: Icon(Iconsax.home), label: 'home'),
              NavigationDestination(
                  icon: Icon(Iconsax.heart), label: 'Wishlist'),
              NavigationDestination(icon: Icon(Iconsax.shop), label: 'Your Orders'),
              NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
            ]),
      ),
      body: Obx(() => controller.screens[controller.selectedindex.value]),
    );
  }
}

class NavigationController extends GetxController {
  NavigationController({
    required this.dark1,
    required this.image,
    required this.title,
    required this.saleprice,
    required this.finalprice,
    required this.brand,
    required this.discount,
    required this.ratings,
    required this.index,
  });

  final bool dark1;
  final String image;
  final String title;
  final String saleprice;
  final int finalprice;
  final String brand;
  final String discount;
  final String ratings;
  final int index;
  final Rx<int> selectedindex = 0.obs;

  late final screens = [
    HomeScreen(),
    // FavouriteScreen(
    //     dark: dark1,
    //     image: image,
    //     title: title,
    //     saleprice: saleprice,
    //     finalprice: finalprice,
    //     brand: brand,
    //     discount: discount,
    //     ratings: ratings,
    //     index: index),
    const FavScreen(),
    //  MyOrders(
    //     dark: dark1,
    //     image: image,
    //     title: title,
    //     saleprice: saleprice,
    //     finalprice: finalprice,
    //     brand: brand,
    //     discount: discount,
    //     ratings: ratings,
    //     index: index),
    Order_Display(
        dark: dark1,
        image: image,
        title: title,
        saleprice: saleprice,
        finalprice: finalprice,
        brand: brand,
        discount: discount,
        ratings: ratings,
        index: index),
    const SettingScreen()
  ];
}
