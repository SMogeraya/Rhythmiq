import 'package:get/get.dart';

class HomeControler extends GetxController {
  static HomeControler get instance => Get.find();

  final carosalCurrentIndex = 0.obs;

  void updatePageIndicator(index) {
    carosalCurrentIndex.value = index;
  }
}
