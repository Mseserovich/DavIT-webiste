import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/controllers/cart_controller.dart';
import 'package:mobileapp/data/repository/popular_product_repo.dart';
import 'package:mobileapp/utils/colors.dart';

import '../models/cart_model.dart';
import '../models/products_model.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList=[];
  List<dynamic> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded=>_isLoaded;

  int _quantity = 0;
  int get quantity=>_quantity; //getter function uses arrow notation
  int _inCartItems = 0;
  int get inCartItems =>_inCartItems+_quantity;

  Future<void> getPopularProductList()async {
    Response response = await popularProductRepo.getPopularProductList(); //Response type coz getPopularProductList returns a Response type object
    if(response.statusCode==200){
      // print("got products");
      _popularProductList=[]; //to make sure theres no data inside list
      _popularProductList.addAll(Product.fromJson(response.body).products);
      update(); //is more like setstate coz it updates the UI with new data
      // print(popularProductList);
      _isLoaded=true;
    }else{
      print("didnt get products");
    }
  }

  void setQuantity(bool isIncrement){
    if(isIncrement){
      // print("inrement "+ _quantity.toString());
      print("number of items"+_quantity.toString());
      _quantity =checkQuantity(_quantity+1);
    }else{
      _quantity = checkQuantity(_quantity-1);
    }
    update(); //built inside getx to update ui in real time
  } 

//helper for setQuantity
  int checkQuantity(int quantity){
    if(_inCartItems+quantity<0){
      Get.snackbar("Item Count", "Can't reduce anymore",
      backgroundColor: AppColors.mainColor,
      colorText: Colors.white);
      if(_inCartItems>0){
        _quantity = -_inCartItems;
        return _quantity;
      }
      return 0;
    }else if(_inCartItems+quantity>20){
      Get.snackbar("Item Count", "Can't add anymore",
      backgroundColor: AppColors.mainColor,
      colorText: Colors.white);
      return 20;
    }else{
      return quantity;
    }
  }

  // get from storage from previously saved similar items in the cart
  void initProduct(ProductModel product, CartController cart){
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    print("exist or not"+exist.toString());
    if(exist){
      _inCartItems=cart.getQuantity(product);
    }
    print("the quantity in the cart is "+_inCartItems.toString());
  }

  void addItem(ProductModel product){
    
      _cart.addItem(product, _quantity);

      _quantity = 0;
      _inCartItems=_cart.getQuantity(product);
      _cart.items.forEach((key, value) { 
        print("The id is "+value.id.toString()+" The quantity is "+value.quantity.toString());
      });
      update();
  }
  int get totalItems{
    return _cart.totalItems;
  }

  List<CartModel> get getItems{
    return _cart.getItems;
  }
}