import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:soul_tunes/commen/list_tile/products.dart';
/*import 'package:iconsax/iconsax.dart';
import 'package:soul_tunes/commen/widget/custom_shapes/appbar/appbar.dart';*/
import 'package:soul_tunes/commen/widget/custom_shapes/container/CircleContainer.dart';
import 'package:soul_tunes/commen/widget/custom_shapes/container/search_conainer.dart';
import 'package:soul_tunes/commen/widget/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:soul_tunes/commen/widget/layouts/grid.dart';
import 'package:soul_tunes/commen/widget/products/product_cards/product_card_vertical.dart';
import 'package:soul_tunes/features/shop/screens/home/widgets/promoSlider.dart';
import 'package:soul_tunes/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:soul_tunes/features/shop/screens/product_details/product_details.dart';
import 'package:soul_tunes/utils/constants/colors.dart';
import 'package:soul_tunes/utils/constants/helper_functions.dart';
import 'package:soul_tunes/utils/constants/image_strings.dart';
import 'package:soul_tunes/utils/constants/sizes.dart';
/*import 'package:soul_tunes/utils/constants/text_strings.dart';
import 'package:soul_tunes/utils/devices/device_utility.dart';
import 'package:soul_tunes/utils/helpers/helper_functions.dart';*/

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List<Map<String, dynamic>> gridMap = [
    {
      "title": "Yamaha Guitar",
      "saleprice": "6000 Rs",
      "images": SImages.guitar2,
      "brand": "Gibson",
      "finalprice": 5000,
      "ratings": "5",
      "discount": "16%",
    },
    {
      "title": "Flute-G1",
      "saleprice": "2000 Rs",
      "images": SImages.flute1,
      "brand": "Gibson",
      "finalprice": 1800,
      "ratings": "5",
      "discount": "10%",
    },
    {
      "title": "GuitarLight",
      "saleprice": "6000 Rs",
      "images": SImages.guitarLight,
      "brand": "Yamaha",
      "finalprice": 5000,
      "ratings": "5",
      "discount": "16%",
    },
    {
      "title": "Saxophone-XUV5",
      "saleprice": "6000 Rs",
      "images": SImages.saxophoneVertical,
      "brand": "Yamaha",
      "finalprice": 5000,
      "ratings": "4.5",
      "discount": "15%",
    },
    {
      "title": "Saxophone-XUV6",
      "saleprice": "4000 Rs",
      "images": SImages.saxophone3,
      "brand": "Gibson",
      "finalprice": 3600,
      "ratings": "5",
      "discount": "10%",
    },
    {
      "title": "Violin",
      "saleprice": "7890 Rs",
      "images": SImages.violin1,
      "brand": "Roland",
      "finalprice": 6627,
      "ratings": "4.5",
      "discount": "16%",
    },
    {
      "title": "Mandolin",
      "saleprice": "7890 Rs",
      "images": SImages.mandolin_1,
      "brand": "Roland",
      "finalprice": 6627,
      "ratings": "4.5",
      "discount": "16%",
    },
    {
      "title": "Flute",
      "saleprice": "1890 Rs",
      "images": SImages.flute2,
      "brand": "Roland",
      "finalprice": 6627,
      "ratings": "4.5",
      "discount": "16%",
    },
    {
      "title": "Flute",
      "saleprice": "7890 Rs",
      "images": SImages.flute3,
      "brand": "Roland",
      "finalprice": 6627,
      "ratings": "4.5",
      "discount": "16%",
    },
    {
      "title": "Violin-GFR",
      "saleprice": "7000 Rs",
      "images": SImages.violin_1,
      "brand": "Yamaha",
      "finalprice": 6000,
      "ratings": "5",
      "discount": "15%",
    },
    {
      "title": "Clariet",
      "saleprice": "7000 Rs",
      "images": SImages.clariet_1,
      "brand": "Yamaha",
      "finalprice": 6000,
      "ratings": "5",
      "discount": "15%",
    },
    {
      "title": "Saxophone-AMF",
      "saleprice": "7000 Rs",
      "images": SImages.saxophone2,
      "brand": "Yamaha",
      "finalprice": 6000,
      "ratings": "4.5",
      "discount": "15%",
    },
    {
      "title": "Violin-GF",
      "saleprice": "6000 Rs",
      "images": SImages.violin2,
      "brand": "Yamaha",
      "finalprice": 5000,
      "ratings": "4.1",
      "discount": "16%",
    },
    {
      "title": "Chinesedrum",
      "saleprice": "7000 Rs",
      "images": SImages.chinesedrum,
      "brand": "Yamaha",
      "finalprice": 6000,
      "ratings": "4.0",
      "discount": "15%",
    },
    {
      "title": "Clariet",
      "saleprice": "6000 Rs",
      "images": SImages.clariett,
      "brand": "Yamaha",
      "finalprice": 5000,
      "ratings": "4.6",
      "discount": "16%",
    },
    {
      "title": "Djembe",
      "saleprice": "7000 Rs",
      "images": SImages.djembe2,
      "brand": "Yamaha",
      "finalprice": 6000,
      "ratings": "3.6",
      "discount": "15%",
    },
    {
      "title": "Piano",
      "saleprice": "9000 Rs",
      "images": SImages.pianoo,
      "brand": "Yamaha",
      "finalprice": 7650,
      "ratings": "4.5",
      "discount": "15%",
    },
    {
      "title": "Djembe Iconic",
      "saleprice": "8000 Rs",
      "images": SImages.djembe,
      "brand": "Yamaha",
      "finalprice": 6800,
      "ratings": "4.5",
      "discount": "15%",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Costum shape
            CurvedEdgeWidget(
              child: Container //the blue box
                  (
                      height: 200,
                      color: SColors.primary,
                      padding: const EdgeInsets.all(0),
                      child: Stack(
                        children: [
                          //stacking circles on blue box
                          Positioned(
                              top: -150,
                              right: -250,
                              child: CircularContainer(
                                  //Circles
                                  backgroundColor:
                                      SColors.textWhite.withOpacity(0.1))),
                          Positioned(
                            top: 100,
                            right: 300,
                            child: CircularContainer(
                                backgroundColor:
                                    SColors.textWhite.withOpacity(0.1)),
                          ),
                          const SizedBox(
                            height: SSizes.spaceBtwSections,
                          ),
                          const SHomeAppBar(),
                          // const SearchControllers(text: 'Search in Store'),

                          const SizedBox(
                            height: SSizes.spaceBtwSections,
                          ),
                          Positioned(
                            top: 95,
                            left: 30,
                            child: Text(
                              "Popular Instruments",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .apply(color: SColors.white),
                            ),
                          ),

                          const Positioned(
                              top: 120,
                              left: 15,
                              child: Row(
                                children: [
                                  /* Expanded(
                                   SizedBox(
                                    height: 80,*/
                                  /* child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: 7,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (_, index) {*/
                                  ScrollImage(
                                    image: SImages.guiter,
                                    title: "Yamaha Guitar",
                                    saleprice: "6000 Rs",
                                    images: SImages.guitar2,
                                    brand: "Gibson",
                                    finalprice: 5000,
                                    ratings: "5",
                                    discount: "16%",
                                  ),
                                  SizedBox(
                                    width: SSizes.spaceBtwSections / 1.4,
                                    /* ),*/
                                    /* }),*/
                                    /* ),*/
                                  ),
                                  ScrollImage(
                                    image: SImages.piano_icon,
                                    title: "saxophone2",
                                    saleprice: "7000 Rs",
                                    images: SImages.pianoo,
                                    brand: "Yamaha",
                                    finalprice: 6000,
                                    ratings: "4.5",
                                    discount: "15%",
                                  ),
                                  SizedBox(
                                    width: SSizes.spaceBtwSections / 1.4,
                                  ),
                                  ScrollImage(
                                    image: SImages.saxophone_icon,
                                    title: "saxophoneVertical",
                                    saleprice: "6000 Rs",
                                    images: SImages.saxophoneVertical,
                                    brand: "Yamaha",
                                    finalprice: 5000,
                                    ratings: "4.5",
                                    discount: "15%",
                                  ),
                                  SizedBox(
                                    width: SSizes.spaceBtwSections / 1.4,
                                  ),
                                  ScrollImage(
                                    image: SImages.drums_icon,
                                    title: "saxophone2",
                                    saleprice: "7000 Rs",
                                    images: SImages.djembe2,
                                    brand: "Yamaha",
                                    finalprice: 6000,
                                    ratings: "4.5",
                                    discount: "15%",
                                  ),
                                  SizedBox(
                                    width: SSizes.spaceBtwSections / 1.4,
                                  ),
                                  ScrollImage(
                                    image: SImages.violin_icon,
                                    title: "guitarLight",
                                    saleprice: "6000 Rs",
                                    images: SImages.guitarLight,
                                    brand: "Yamaha",
                                    finalprice: 5000,
                                    ratings: "5",
                                    discount: "16%",
                                  ),
                                  SizedBox(
                                    width: SSizes.spaceBtwSections / 1.4,
                                  ),
                                ],
                              )),
                        ],
                      )),
            ),
//Body slider
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: SSizes.defaultSpace / 2,
                  vertical: SSizes.defaultSpace / 3.5),
              child: Column(children: [
                ///---Promo Slider
                const PromoSlider(),
                const SizedBox(
                  height: SSizes.spaceBtwItems / 3.5,
                ),

                // ///--- Popular Products
                // SGridView(
                //   itmCount: 1,
                //   mainAxisExtent: 288,
                //   itemBuilder: (_, index) => const SProductVertical(image: SImages.flute,),
                // ),
                //  SGridView(
                //   itmCount: 1,
                //   mainAxisExtent: 288,
                //   itemBuilder: (_, index) => const SProductVertical(image: SImages.guiter,),
                // ),
                //  SGridView(
                //   itmCount: 1,
                //   mainAxisExtent: 288,
                //   itemBuilder: (_, index) => const SProductVertical(image: SImages.guitar2,),
                // ),
                //  SGridView(
                //   itmCount: 1,
                //   mainAxisExtent: 288,
                //   itemBuilder: (_, index) => const SProductVertical(image: SImages.drums,),
                // ),
                SizedBox(
                  height: SSizes.spaceBtwSections / 1.4,
                ),
                Gridnew(
                  itemBuilder: (_, index) => SProductVertical(
                    image: "${gridMap.elementAt(index)['images']}",
                    title: "${gridMap.elementAt(index)['title']}",
                    discount: "${gridMap.elementAt(index)['discount']}",
                    ratings: "${gridMap.elementAt(index)['ratings']}",
                    saleprice: "${gridMap.elementAt(index)['saleprice']}",
                    finalprice: gridMap.elementAt(index)['finalprice'],
                    brand: "${gridMap.elementAt(index)['brand']}",
                    index: index,
                  ),
                  gridMap: gridMap,
                )
              ]), // common/widget/images
            )
          ],
        ),
      ),
    );
  }
}

//Round icons
class ScrollImage extends StatelessWidget {
  const ScrollImage({
    super.key,
    required this.image,
    required this.title,
    required this.discount,
    required this.ratings,
    required this.saleprice,
    required this.finalprice,
    required this.brand,
    required this.images,
  });

  final String image;
  final String images;
  final String title;
  final String discount;
  final String ratings;
  final String saleprice;
  final int finalprice;
  final String brand;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 252, 250, 250),
            borderRadius: BorderRadius.circular(50),
          ),
          child: IconButton(
              onPressed: () => Get.to(() => ProductDetailScreen(
                    image: images,
                    title: title,
                    discount: discount,
                    ratings: ratings,
                    saleprice: saleprice,
                    finalprice: finalprice,
                    brand: brand,
                  )),
              icon: Image(image: AssetImage(image))),
        ),
        // Text("abc"),
      ],
    );
  }
}



// {
//   "workbench.colorTheme": "Default Dark+",
//   "oracledevtools.bookmarkFileFolder": "C:\\Users\\jagadeeshbhat\\Oracle\\oracle.oracledevtools",
//   "oracledevtools.download.otherFolder": "C:\\Users\\jagadeeshbhat\\downloads",
//   "oracledevtools.connectionConfiguration.configFilesFolder": "C:\\Users\\jagadeeshbhat\\Oracle\\network\\admin",
//   "oracledevtools.connectionConfiguration.walletFileFolder": "C:\\Users\\jagadeeshbhat\\Oracle\\network\\admin",
//   "livePreview.debugOnExternalPreview": true,
//   "livePreview.showServerStatusNotifications": true,
//   "editor.formatOnSave": true,
//   "[typescriptreact]": {
//     "editor.defaultFormatter": "esbenp.prettier-vscode"
//   },
//   "emulator.emulatorPathWindows": "C:\\Users\\jagadeeshbhat\\AppData\\Local\\Android\\Sdk\\emulator",
//   "[dart]": {
//     "editor.formatOnSave": true,
//     "editor.formatOnType": true,
//     "editor.rulers": [80],
//     "editor.selectionHighlight": false,
//     "editor.suggestSelection": "first",
//     "editor.tabCompletion": "onlySnippets",
//     "editor.wordBasedSuggestions": "off"
//   },
//   "dart.debugExternalPackageLibraries": false,
//   "dart.debugSdkLibraries": false,
//   "workbench.editorAssociations": {
//     "*.apk": "default"
//   },
//   "files.autoSave": "afterDelay"
// }
