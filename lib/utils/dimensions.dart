import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height; // 683.4285714285714
  static double screenWidth = Get.context!.width; // 411.42857142857144

  static double pageView =
      screenHeight / 2.135714285714731; // 320 (for the whole container)
  static double pageViewContainer =
      screenHeight / 3.106493506494155; // 220 (for the smaller container)
  static double pageViewTextContainer =
      screenHeight / 5.695238095239283; // 120 (for text)



  //  dynamic height for padding and margin

  static double height10 = screenHeight / 68.34285714285714;
  static double height14 = screenHeight / 48.81632653;
  static double height15 = screenHeight / 45.56190476;
  static double height20 = screenHeight / 34.17142857;
  static double height30 = screenHeight / 22.78095238;
  static double height45 = screenHeight / 15.187301587;

  //  dynamic width for padding and margin
  static double width10 = screenHeight / 68.34285714285714;
  static double width14 = screenHeight / 48.81632653;
  static double width15 = screenHeight / 45.56190476;
  static double width20 = screenHeight / 34.17142857;
  static double width30 = screenHeight / 22.78095238;
  static double width45 = screenHeight / 15.187301587;

  static double font20 = screenHeight / 34.17142857;

  //  dynamic radius
  static double radius15 = screenHeight / 45.56190476;
  static double radius20 = screenHeight / 34.17142857;
  static double radius30 = screenHeight / 22.78095238;

  // Icon size
  static double iconSize24 = screenHeight / 28.476190476;

  // List View Size
  static double listViewImgSize = screenWidth / 3.42857142857;
  static double listViewTextContSize = screenWidth / 4.114285714;
  static double popularFoodImgSize = screenHeight / 1.941558441558;

 
}
