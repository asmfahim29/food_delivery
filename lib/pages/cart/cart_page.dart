import 'package:flutter/material.dart';
import 'package:food_apps/colors.dart';
import 'package:food_apps/controllers/popular_product_controller.dart';
import 'package:food_apps/controllers/recommended_product_controller.dart';
import 'package:food_apps/helper/routes/route_helper.dart';
import 'package:food_apps/utils/ap_constants.dart';
import 'package:food_apps/utils/dimensions.dart';
import 'package:food_apps/widgets/app_icon.dart';
import 'package:food_apps/widgets/big_text.dart';
import 'package:food_apps/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../controllers/cart_controller.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: Dimensions.width20,
            right: Dimensions.width20,
            top: Dimensions.height20 * 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                  backgroundColor: AppColor.mainColor,
                  size: Dimensions.iconSize40,
                  iconColor: AppColor.buttonBGColor,
                ),
                SizedBox(
                  width: Dimensions.width20 * 8,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    backgroundColor: AppColor.mainColor,
                    size: Dimensions.iconSize40,
                    iconColor: AppColor.buttonBGColor,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  backgroundColor: AppColor.mainColor,
                  size: Dimensions.iconSize40,
                  iconColor: AppColor.buttonBGColor,
                ),
              ],
            ),
          ),
          Positioned(
            top: Dimensions.height20 * 5,
            left: Dimensions.width10,
            right: Dimensions.width10,
            bottom: Dimensions.height20 * 0,
            child: Container(
              //color: Colors.red,
              margin: EdgeInsets.only(top: Dimensions.height10),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GetBuilder<CartController>(
                  builder: (cartController) {
                    //list of items that we have on cart page
                    var _cartList = cartController.getItems;
                    return ListView.builder(
                      itemCount: _cartList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: Dimensions.height20 * 5,
                          width: double.maxFinite,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  //taking the list and passing the object that coming from
                                  //_cartList[index].productModel!
                                  var popularIndex =
                                      Get.find<PopularProductController>()
                                          .popularProductList
                                          .indexOf(
                                              _cartList[index].productModel!);

                                  if (popularIndex >= 0) {
                                    print("find the recommended ID");
                                    Get.toNamed(RouteHelper.getPopularFood(
                                        popularIndex, "cartPage"));
                                  } else {
                                    var recommendedIndex =
                                        Get.find<RecommendedProductController>()
                                            .recommendedProductList
                                            .indexOf(
                                                _cartList[index].productModel!);
                                    Get.toNamed(RouteHelper.getRecommendedFood(
                                        recommendedIndex, "cartPage"));
                                  }
                                },
                                child: Container(
                                  width: Dimensions.height20 * 5,
                                  height: Dimensions.height20 * 5,
                                  margin: EdgeInsets.only(
                                      bottom: Dimensions.height10),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(AppConstants
                                              .BASE_URL +
                                          AppConstants.UPLOAD_URL +
                                          cartController.getItems[index].img!),
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      Dimensions.radius20,
                                    ),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: Dimensions.width10,
                              ),
                              Expanded(
                                child: Container(
                                  height: Dimensions.height20 * 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      BigText(
                                        text: cartController
                                            .getItems[index].name!,
                                        color: Colors.black54,
                                      ),
                                      SmallText(text: "Spicy"),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          BigText(
                                            text: cartController
                                                .getItems[index].price!
                                                .toString(),
                                            color: Colors.redAccent,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: Dimensions.height10,
                                                bottom: Dimensions.height10,
                                                left: Dimensions.width20,
                                                right: Dimensions.width20),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions.radius20),
                                                color: Colors.white),
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    //call the method from controller
                                                    cartController.addItem(
                                                        _cartList[index]
                                                            .productModel!,
                                                        -1);
                                                  },
                                                  child: const Icon(
                                                    Icons.remove,
                                                    color: AppColor.signColor,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: Dimensions.width35 / 2,
                                                ),
                                                BigText(
                                                  text: _cartList[index]
                                                      .quantity
                                                      .toString(),
                                                ),
                                                SizedBox(
                                                  width: Dimensions.width35 / 2,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    //call the method from controller
                                                    cartController.addItem(
                                                        _cartList[index]
                                                            .productModel!,
                                                        1);
                                                  },
                                                  child: const Icon(
                                                    Icons.add,
                                                    color: AppColor.signColor,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (cartController) {
          return Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
              top: Dimensions.height35,
              bottom: Dimensions.height35,
              left: Dimensions.width10,
              right: Dimensions.width10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20 * 2),
                topRight: Radius.circular(Dimensions.radius20 * 2),
              ),
              color: AppColor.buttonBGColor,
            ),
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
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: Dimensions.width35 / 2,
                      ),
                      BigText(
                        text: "\$ ${cartController.totalAmount.toString()}",
                      ),
                      SizedBox(
                        width: Dimensions.width35 / 2,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // popularProduct.addItem(product);
                    print("Tapped check out");
                    cartController.addToHistory();
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                      top: Dimensions.height15,
                      bottom: Dimensions.height15,
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColor.mainColor,
                    ),
                    child: BigText(
                      text: "Check out",
                      color: Colors.white,
                    ),
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