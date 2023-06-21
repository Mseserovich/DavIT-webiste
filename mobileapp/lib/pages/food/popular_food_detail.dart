import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/controllers/popular_product_controller.dart';
import 'package:mobileapp/pages/cart/cart_page.dart';
import 'package:mobileapp/pages/home/main_food_page.dart';
import 'package:mobileapp/routes/route_helper.dart';
import 'package:mobileapp/utils/app_constants.dart';
import 'package:mobileapp/utils/dimensions.dart';
import 'package:mobileapp/widgets/app_column.dart';
import 'package:mobileapp/widgets/app_icon.dart';
import 'package:mobileapp/widgets/expandable_text.dart';
import 'package:mobileapp/widgets/icon_and_text.dart';

import '../../controllers/cart_controller.dart';
import '../../utils/colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  int pageId;
  final String page;
  PopularFoodDetail({super.key, required this.pageId, required this.page});

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct(product, Get.find<CartController>());  // has to be called on every page to reset the state item quantity
    print("page is id"+pageId.toString());
    print("product name is "+product.name);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background Image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img)
                )
              ),
            ),
          ),
          //Icon Widgets
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    if(page=="cartpage"){
                      Get.toNamed(RouteHelper.getCartPage());
                    }else{
                      Get.toNamed(RouteHelper.getInitial());
                    }
                  },
                  child: AppIcon(icon: Icons.arrow_back_ios)),
                GetBuilder<PopularProductController>(builder: (controller){
                  return Stack(children: [
                    GestureDetector(
                      onTap: (){
                        // print("tapped here");
                        if(controller.totalItems>=1)
                          Get.toNamed(RouteHelper.getCartPage());
                      },
                      child: AppIcon(icon: Icons.shopping_cart_outlined)),
                    controller.totalItems>=1?
                    Positioned(
                      right: 0,top: 0,
                      child: AppIcon(icon: Icons.circle, size: 20,iconColor: Colors.transparent,
                      backgroundColor: AppColors.mainColor,),
                    ):Container(),
                    controller.totalItems>=1?
                    Positioned(
                      right: 5,top: 3,
                      
                      child: BigText(text: Get.find<PopularProductController>().totalItems.toString(), size: 14, color: Colors.white,),
                    ):Container()
                  ],);
                })
                
              ],
            ),
          ),
          // Introduction of food
          Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  top: Dimensions.popularFoodImgSize,
                  child: Container(
                    padding: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      top: Dimensions.height20
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius20),
                        topRight: Radius.circular(Dimensions.radius20)
                      ),
                      color: Colors.white
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppColumn(text: product.name!,),
                        SizedBox(height: Dimensions.height20,),
                        BigText(text: "Ïntroduce",),
                        SizedBox(height: Dimensions.height10,),
                        Expanded(child: SingleChildScrollView(child: ExpandableTextWidget(text: product.description)))
                        // BigText(text: "Greek Spinach mixed with Basotho pork smothered in vaseline")
                      ],
                    )
                  ),
                ),
        ],
        //Expandable Text Widget
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProduct){
        return Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(top: Dimensions.height30, bottom: Dimensions.height30, left: Dimensions.width20, right: Dimensions.width20),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20*2),
            topRight: Radius.circular(Dimensions.radius20*2)
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      popularProduct.setQuantity(false);
                    },
                    child: Icon(Icons.remove, color: AppColors.signColor,)),
                  SizedBox(width: Dimensions.width10/2,),
                  BigText(text: popularProduct.inCartItems.toString()),
                  SizedBox(width: Dimensions.width10/2,),
                  GestureDetector(
                    onTap: (){
                      popularProduct.setQuantity(true);
                    },
                    child: Icon(Icons.add, color: AppColors.signColor,))
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                    popularProduct.addItem(product);
                  },
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.height20),   
                  child: BigText(text: "R ${product.price!} "+"| Add to Cart", color: Colors.white,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: AppColors.mainColor
                ),
              ),
            ),
          ],
        ),
      );
      }),
    );
  }
}