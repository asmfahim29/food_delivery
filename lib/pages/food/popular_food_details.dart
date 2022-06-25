import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_apps/colors.dart';
import 'package:food_apps/controllers/popular_product_controller.dart';
import 'package:food_apps/utils/ap_constants.dart';
import 'package:food_apps/utils/dimensions.dart';
import 'package:food_apps/widgets/app_column.dart';
import 'package:food_apps/widgets/app_icon.dart';
import 'package:food_apps/widgets/expandable_text.dart';
import 'package:get/get.dart';

import '../../widgets/big_text.dart';

class PopularFoodDetail extends StatelessWidget {
  int pageId;
  PopularFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImgSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      "${AppConstants.BASE_URL}${AppConstants.UPLOAD_URL}${product.img!}",
                    ),
                  ),
                ),
              )),
          //icon button(back and cart)
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: AppIcon(icon: Icons.arrow_back_ios),
                ),
                AppIcon(icon: Icons.add_shopping_cart_outlined),
              ],
            ),
          ),
          //introduction field
          Positioned(
              top: Dimensions.popularFoodImgSize - 20,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.radius20),
                        topLeft: Radius.circular(Dimensions.radius20)),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(
                      text: product.name!,
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    BigText(
                      text: 'Introduce',
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ExpandableText(text: product.description!),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (popularProduct) {
          return Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
                top: Dimensions.height35,
                bottom: Dimensions.height35,
                left: Dimensions.width10,
                right: Dimensions.width10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20 * 2),
                    topRight: Radius.circular(Dimensions.radius20 * 2)),
                color: AppColor.buttonBackgrndColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height10,
                      bottom: Dimensions.height10,
                      left: Dimensions.width20,
                      right: Dimensions.width20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          //call the method from controller
                          popularProduct.setQuantity(false);
                        },
                        child: Icon(
                          Icons.remove,
                          color: AppColor.signColor,
                        ),
                      ),
                      SizedBox(
                        width: Dimensions.width35 / 2,
                      ),
                      BigText(text: popularProduct.quantity.toString()),
                      SizedBox(
                        width: Dimensions.width35 / 2,
                      ),
                      GestureDetector(
                        onTap: () {
                          //call the method from controller
                          popularProduct.setQuantity(true);
                        },
                        child: Icon(
                          Icons.add,
                          color: AppColor.signColor,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height15,
                      bottom: Dimensions.height15,
                      left: Dimensions.width20,
                      right: Dimensions.width20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColor.mainColor,
                  ),
                  child: BigText(
                    text: "\$ ${product.price!} | Add to cart",
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
