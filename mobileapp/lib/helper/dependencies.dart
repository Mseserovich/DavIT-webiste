import 'package:get/get.dart';
import 'package:mobileapp/controllers/cart_controller.dart';
import 'package:mobileapp/controllers/popular_product_controller.dart';
import 'package:mobileapp/data/api/api_client.dart';
import 'package:mobileapp/data/repository/cart_repo.dart';
import 'package:mobileapp/data/repository/popular_product_repo.dart';
import 'package:mobileapp/utils/app_constants.dart';

import '../controllers/recommended_product_controller.dart';
import '../data/repository/recommended_product_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init()async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences,);
  //api client
  Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstants.BASE_URL));
  //repos
  Get.lazyPut(()=>PopularProductRepo(apiClient: Get.find())); //find info insside getx
  Get.lazyPut(()=>RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}