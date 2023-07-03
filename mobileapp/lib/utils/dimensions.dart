import 'package:get/get.dart';

class Dimensions{
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
  //caculating device factor for different screen sizes 683.43/220 = 3.11
  static double pageView = screenHeight/2.14;
  static double pageViewContainer = screenHeight/3.11;
  static double pageViewTextContainer = screenHeight/5.69;
  //calculating factor for height 10 sizedbox, padding and margin
  static double height10 = screenHeight/68.34;
  static double height15 = screenHeight/45.56;
  static double height20 = screenHeight/34.17;
  static double height30 = screenHeight/22.78;
  static double height45 = screenHeight/15.12;

  //sized box width, padding and margin
  static double width5 = screenHeight/136.69;
  static double width10 = screenHeight/68.34;
  static double width15 = screenHeight/45.56;
  static double width20 = screenHeight/34.17;
  static double width30 = screenHeight/22.78;
  static double width45 = screenHeight/15.12;
  
  //font size
  static double font20 = screenHeight/34.17;
  static double font12 = screenHeight/56.95;
  static double font16 = screenHeight/42.71;
  static double font26 = screenHeight/26.28;

  // border radius
  static double radius15 = screenHeight/45.56;
  static double radius20 = screenHeight/34.17;
  static double radius30 = screenHeight/22.78;

  //default icon Size is 24
  static double iconSize24 = screenHeight/28.47;
  static double iconSize16 = screenHeight/42.71;

  // list view size popular food
  static double listViewImgSize = screenWidth/3.43;
  static double listViewTextContSize = screenWidth/4.11;

  //popular food detail
  static double popularFoodImgSize = screenHeight/2.28;

  //bottom height
  static double bottomHeightBar = screenHeight/5.60;

  // splash screen
  static double splashImg = screenHeight/2.74;

}