import 'package:get/get.dart';
import 'package:mobileapp/pages/food/popular_food_detail.dart';
import 'package:mobileapp/pages/food/recommended_food_detail.dart';
import 'package:mobileapp/pages/home/home_page.dart';
import 'package:mobileapp/pages/home/main_food_page.dart';

import '../pages/cart/cart_page.dart';
import '../pages/splash/splash_page.dart';

class RouteHelper{
  static const String initial = "/";
  static const String splashPage = "/splash-page";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";

  static String getSplashPage()=>'$splashPage';
  static String getPopularFood(int pageId, String page)=>'$popularFood?pageId=$pageId&page=$page';
  static String getInitial()=>'$initial';
  static String getrecommendedFood(int pageId, String page)=>'$recommendedFood?pageId=$pageId&page=$page';
  static String getCartPage()=>'$cartPage';

  static List<GetPage> routes = [
    GetPage(name: initial, page: ()=>HomePage()),

    GetPage(name: splashPage, page: ()=>SplashScreen()),

    GetPage(name: popularFood, page:(){
      // print("popular-food gets called");
      var pageId=Get.parameters['pageId'];
      var page = Get.parameters["page"];
      return PopularFoodDetail(pageId:int.parse(pageId!), page:page!);
    }, transition: Transition.fadeIn
    ),

    GetPage(name: recommendedFood, page:(){
      // print("popular-food gets called");
      var pageId=Get.parameters['pageId'];
      var page = Get.parameters["page"];
      return RecommendedFoodDetail(pageId:int.parse(pageId!), page:page!);
    }, transition: Transition.fadeIn
    ),

    GetPage(name: cartPage, page:(){
      return CartPage();
    }, transition: Transition.fadeIn
    )
  ];
}