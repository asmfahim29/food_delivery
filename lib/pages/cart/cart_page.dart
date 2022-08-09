import 'package:flutter/material.dart';
import 'package:food_apps/colors.dart';
import 'package:food_apps/pages/home/main_food_page.dart';
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
                    Get.to(() => MainFoodPage());
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
                    return ListView.builder(
                        itemCount: cartController.getItems.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: Dimensions.height20 * 5,
                            width: double.maxFinite,
                            child: Row(
                              children: [
                                Container(
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
                                        Dimensions.radius20),
                                    color: Colors.white,
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
                                                      //popularProduct.setQuantity(false);
                                                    },
                                                    child: Icon(
                                                      Icons.remove,
                                                      color: AppColor.signColor,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        Dimensions.width35 / 2,
                                                  ),
                                                  BigText(text: "0"),
                                                  SizedBox(
                                                    width:
                                                        Dimensions.width35 / 2,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      //call the method from controller
                                                      //popularProduct.setQuantity(true);
                                                    },
                                                    child: Icon(
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
                        });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
