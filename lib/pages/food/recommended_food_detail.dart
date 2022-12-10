import 'package:flutter/material.dart';
import 'package:food_apps/colors.dart';
import 'package:food_apps/controllers/popular_product_controller.dart';
import 'package:food_apps/controllers/recommended_product_controller.dart';
import 'package:food_apps/helper/routes/route_helper.dart';
import 'package:food_apps/utils/ap_constants.dart';
import 'package:food_apps/utils/dimensions.dart';
import 'package:food_apps/widgets/app_icon.dart';
import 'package:food_apps/widgets/big_text.dart';
import 'package:food_apps/widgets/expandable_text.dart';
import 'package:get/get.dart';

import '../../controllers/cart_controller.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;
  final String rPage;
  const RecommendedFoodDetail(
      {Key? key, required this.pageId, required this.rPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var recommendedProduct =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(recommendedProduct, Get.find<CartController>());
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
                  onTap: () {
                    if (rPage == "cartPage") {
                      Get.toNamed(RouteHelper.getCartPage());
                    } else {
                      Get.toNamed(RouteHelper.getInitial());
                    }
                  },
                  child: AppIcon(
                    icon: Icons.clear,
                  ),
                ),
                //AppIcon(icon: Icons.add_shopping_cart_outlined)
                GetBuilder<PopularProductController>(
                  builder: ((controller) {
                    return GestureDetector(
                      onTap: () {
                        /*if (controller.totalItems >= 1) {
                          print("taped here");
                          Get.toNamed(
                            RouteHelper.getCartPage(),
                          );
                        }*/
                        Get.toNamed(
                          RouteHelper.getCartPage(),
                        );
                      },
                      child: Stack(
                        children: [
                          AppIcon(icon: Icons.shopping_cart_outlined),
                          controller.totalItems >= 1
                              ? const Positioned(
                                  right: 0,
                                  top: 0,
                                  child: AppIcon(
                                    icon: Icons.circle,
                                    size: 20,
                                    iconColor: Colors.transparent,
                                    backgroundColor: AppColor.mainColor,
                                  ),
                                )
                              : Container(),
                          Get.find<PopularProductController>().totalItems >= 1
                              ? Positioned(
                                  right: 3,
                                  top: 3,
                                  child: BigText(
                                    text: Get.find<PopularProductController>()
                                        .totalItems
                                        .toString(),
                                    size: 12,
                                    color: Colors.white,
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    );
                  }),
                )
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  ),
                ),
                child: Center(
                  child: BigText(
                    text: recommendedProduct.name!,
                    size: Dimensions.fontBigS26,
                  ),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: Color(0xfff8f6f6),
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                "${AppConstants.BASE_URL}${AppConstants.UPLOAD_URL}${recommendedProduct.img!}",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width10, right: Dimensions.width10),
                  child: ExpandableText(text: recommendedProduct.description!),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (controller) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: Dimensions.width20 * 2.5,
                  right: Dimensions.width20 * 2.5,
                  top: Dimensions.height10,
                  bottom: Dimensions.height10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        //for increasing value
                        controller.setQuantity(false);
                      },
                      child: AppIcon(
                        icon: Icons.remove,
                        backgroundColor: AppColor.mainColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.iconSize25,
                      ),
                    ),
                    BigText(
                      text:
                          "\$ ${recommendedProduct.price!}  X  ${controller.inCartItems} ",
                      color: AppColor.mainBlackColor,
                      size: Dimensions.fontBigS26,
                    ),
                    GestureDetector(
                      onTap: () {
                        //for increasing value
                        controller.setQuantity(true);
                      },
                      child: AppIcon(
                        icon: Icons.add,
                        backgroundColor: AppColor.mainColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.iconSize25,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: Dimensions.bottomHeightBar,
                padding: EdgeInsets.only(
                  top: Dimensions.height35,
                  bottom: Dimensions.height35,
                  left: Dimensions.width15,
                  right: Dimensions.width15,
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
                        top: Dimensions.height15,
                        bottom: Dimensions.height15,
                        left: Dimensions.width20,
                        right: Dimensions.width20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: AppColor.mainColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.addItem(recommendedProduct);
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                          top: Dimensions.height15,
                          bottom: Dimensions.height15,
                          left: Dimensions.width20,
                          right: Dimensions.width20,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: AppColor.mainColor,
                        ),
                        child: BigText(
                          text: '\$ ${recommendedProduct.price!} | Add to cart',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
