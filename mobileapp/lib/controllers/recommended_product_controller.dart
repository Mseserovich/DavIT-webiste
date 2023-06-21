import 'package:get/get.dart';
// import 'package:mobileapp/data/repository/_product_repo.dart';

import '../data/repository/recommended_product_repo.dart';
import '../models/products_model.dart';

class RecommendedProductController extends GetxController{
  final RecommendedProductRepo recommendedProductRepo;

  RecommendedProductController({required this.recommendedProductRepo});
  List<dynamic> _recommendedProductList=[];
  List<dynamic> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool get isLoaded=>_isLoaded;

  Future<void> getRecommendedProductList()async {
    Response response = await recommendedProductRepo.getRecommendedProductList(); //Response type coz getPopularProductList returns a Response type object
    if(response.statusCode==200){
      // print("got products");
      _recommendedProductList=[]; //to make sure theres no data inside list
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      update(); //is more like setstate coz it updates the UI with new data
      // print(popularProductList);
      _isLoaded=true;
    }else{
      print("didnt get products");
    }
  }
}