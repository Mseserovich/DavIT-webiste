import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/controllers/cart_controller.dart';
import 'package:mobileapp/pages/cart/cart_page.dart';
// import 'package:mobileapp/pages/food/popular_food_detail.dart';
import 'package:mobileapp/pages/food/recommended_food_detail.dart';
// import 'pages/home/main_food_page.dart';

//upload dependencies
import 'controllers/popular_product_controller.dart';
import 'controllers/recommended_product_controller.dart';
import 'helper/dependencies.dart' as dep;
import 'pages/home/main_food_page.dart';
import 'pages/splash/splash_page.dart';
import 'routes/route_helper.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //it will wait until all dependencies are initialized
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Get.find<PopularProductController>().getPopularProductList();
    // Get.find<RecommendedProductController>().getRecommendedProductList();
    // Wrap material app in getx package or use GetMaterial app
    Get.find<CartController>().getData();
    return GetBuilder<PopularProductController>(builder: (_){
      return GetBuilder<RecommendedProductController>(builder: (_){
        return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome',
      // home: CartPage(),
      // home: MainFoodPage(),
      initialRoute: RouteHelper.getSplashPage(),
      // home: PopularFoodDetail(),
      // home: RecommendedFoodDetail(),
      // home: SplashScreen(), 
      getPages: RouteHelper.routes,
    ); 
      });
    });
  }
}