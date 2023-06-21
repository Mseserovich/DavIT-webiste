import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/controllers/popular_product_controller.dart';
import 'package:mobileapp/controllers/recommended_product_controller.dart';
import 'package:mobileapp/pages/cart/cart_page.dart';
import 'package:mobileapp/routes/route_helper.dart';
import 'package:mobileapp/utils/app_constants.dart';
import 'package:mobileapp/widgets/app_icon.dart';
import 'package:mobileapp/widgets/expandable_text.dart';

import '../../controllers/cart_controller.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';


class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;
  final String page;
  const RecommendedFoodDetail({super.key, required this.pageId, required this.page});

  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>().initProduct(product, Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            title: Row(
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
                  child: AppIcon(icon: Icons.clear),
                ),
                // AppIcon(icon: Icons.add_shopping_cart_outlined)
                GetBuilder<PopularProductController>(builder: (controller){
                  return Stack(children: [
                    GestureDetector(
                      child: GestureDetector(
                        onTap: (){
                          if(controller.totalItems>=1)
                            Get.toNamed(RouteHelper.getCartPage());
                        },
                      child: AppIcon(icon: Icons.shopping_cart_outlined))),
                    controller.totalItems>=1?
                    Positioned(
                      right: 0,top: 0,
                      
                        child: AppIcon(icon: Icons.circle, size: 20,iconColor: Colors.transparent,
                        backgroundColor: AppColors.mainColor,),
                    ):Container(),
                    Get.find<PopularProductController>().totalItems>=1?
                    Positioned(
                      right: 5,top: 3,
                      
                      child: BigText(text: Get.find<PopularProductController>().totalItems.toString(), size: 14, color: Colors.white,),
                    ):Container()
                  ],);
                })
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(30),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20)
                  )
                ),
                // color: Colors.white,
                width: double.maxFinite,
                padding: EdgeInsets.only(top: Dimensions.height10/2, bottom: Dimensions.height10),
                child: Center(child: BigText(text: product.name)),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
                  child: ExpandableTextWidget(text: product.description),
                )
              ],
            )
          )
        ],
      ),
    bottomNavigationBar: GetBuilder<PopularProductController>(builder: (controller){
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width10*5,
              right: Dimensions.width10*5,
              top: Dimensions.height10/2,
              bottom: Dimensions.height20
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    controller.setQuantity(false);
                  },
                  child: AppIcon(icon: Icons.remove, iconColor: Colors.white, backgroundColor: AppColors.mainColor, iconSize: Dimensions.iconSize24,)),                BigText(text: "R${product.price!} X  ${controller.inCartItems}", color: AppColors.mainBlackColor, size: Dimensions.font26),
                GestureDetector(
                  onTap: (){
                    controller.setQuantity(true);
                  },
                  child: AppIcon(icon: Icons.add, iconColor: Colors.white, backgroundColor: AppColors.mainColor, iconSize: Dimensions.iconSize24,))
              ],
            ),
          ),
          Container(
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
              child: Icon(
                Icons.favorite,
                color: AppColors.mainColor,
              )
            ),
          GestureDetector(
            onTap: (){
              controller.addItem(product);
            },
            child: Container(
              padding: EdgeInsets.only(top: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.height20),
              child: BigText(text: "R ${product.price!} | Add to Cart", color: Colors.white,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor
              ),
            ),
          )
          ],
        ),
      ),
        ],
      );
    },)
    );
  }
}