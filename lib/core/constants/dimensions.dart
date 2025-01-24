import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.height;
  static double screenWidth = Get.width;

  // Heights
  static double height10 = screenHeight * 0.01; // 1% of screen height
  static double height20 = screenHeight * 0.02; // 2% of screen height
  static double height50 = screenHeight * 0.05; // 5% of screen height

  // Widths
  static double width10 = screenWidth * 0.01; // 1% of screen width
  static double width20 = screenWidth * 0.02; // 2% of screen width
  static double width50 = screenWidth * 0.05; // 5% of screen width

  // Font Sizes
  static double font20 = screenHeight * 0.025; // 2.5% of screen height
  static double font40 = screenHeight * 0.04;
  static double font50 = screenHeight * 0.05; // 5% of screen height

  // Icon Sizes
  static double iconSize24 = screenHeight * 0.03; // 3% of screen height
  static double iconSize32 = screenHeight * 0.04; // 4% of screen height
}
