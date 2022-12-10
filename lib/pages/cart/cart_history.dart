import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_apps/base/no_data_page.dart';
import 'package:food_apps/colors.dart';
import 'package:food_apps/controllers/cart_controller.dart';
import 'package:food_apps/helper/routes/route_helper.dart';
import 'package:food_apps/utils/ap_constants.dart';
import 'package:food_apps/utils/dimensions.dart';
import 'package:food_apps/widgets/app_icon.dart';
import 'package:food_apps/widgets/big_text.dart';
import 'package:food_apps/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../models/cart_model.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList =
        Get.find<CartController>().getCartHistoryList().reversed.toList();
    Map<String, int> cartItemsPerOrder = Map();

    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemsPerOrder.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }
    print('cart adding time is : \n$cartItemsPerOrder');

    List<int> cartItemsPerOrderToList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
//     return cartItemsPerOrder.entries.map((e){
//         return e.value;
//     }).toList();
    }

    List<String> carOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.key).toList();
//     return cartItemsPerOrder.entries.map((e){
//         return e.value;
//     }).toList();
    }

    List<int> itemsPerOrder = cartItemsPerOrderToList(); //2,2,3
    print(itemsPerOrder);

    //by doing this we can actually know when was my first order as the inner loop finishes
    //thats why mapping
    var listCounter = 0;
    Widget timeWidget(int index) {
      var outputDate = DateTime.now().toString();
      if (index < getCartHistoryList.length) {
        DateTime parseDate = DateFormat('yyyy-MM-dd HH:mm:ss')
            .parse(getCartHistoryList[listCounter].time!);
        var inputDate = DateTime.parse(parseDate.toString());
        var outputformat = DateFormat('MM/dd/yyyy   hh:mm a');
        outputDate = outputformat.format(inputDate);
      }
      return BigText(text: outputDate);
    }

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            width: double.maxFinite,
            color: AppColor.mainColor,
            padding: EdgeInsets.only(top: 45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(
                  text: 'Cart History',
                  color: Colors.white,
                ),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  iconColor: AppColor.mainColor,
                  iconSize: 18,
                  backgroundColor: AppColor.yellowColor,
                )
              ],
            ),
          ),
          GetBuilder<CartController>(builder: (cartController) {
            return cartController.getCartHistoryList().isNotEmpty
                ? Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                        top: Dimensions.height20,
                        right: Dimensions.width10,
                        left: Dimensions.width10,
                      ),

                      //instead of using listView builder we use ListView because listView render data at a time but builder don't

                      child: MediaQuery.removePadding(
                          removeTop: true,
                          context: context,
                          child: ListView(
                            children: [
                              for (int i = 0; i < itemsPerOrder.length; i++)
                                Container(
                                  height: Dimensions.height20 * 7,
                                  margin: EdgeInsets.only(
                                      bottom: Dimensions.height20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      timeWidget(listCounter),
                                      SizedBox(
                                        height: Dimensions.height10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Wrap(
                                            direction: Axis.horizontal,
                                            children: List.generate(
                                                itemsPerOrder[i], (index) {
                                              if (listCounter <
                                                  getCartHistoryList.length) {
                                                listCounter++;
                                              }
                                              return index <= 2
                                                  ? Container(
                                                      height: 70,
                                                      width: 70,
                                                      margin: EdgeInsets.only(
                                                          right: Dimensions
                                                                  .width10 /
                                                              2),
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius
                                                            .circular(Dimensions
                                                                    .radius15 /
                                                                2),
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: NetworkImage(AppConstants
                                                                  .BASE_URL +
                                                              AppConstants
                                                                  .UPLOAD_URL +
                                                              getCartHistoryList[
                                                                      listCounter--]
                                                                  .img!),
                                                        ),
                                                      ),
                                                    )
                                                  : Container();
                                            }),
                                          ),
                                          Container(
                                            height: 80,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                SmallText(
                                                  text: 'Total',
                                                  color: AppColor.titleColor,
                                                ),
                                                BigText(
                                                  text:
                                                      "${itemsPerOrder[i]} Items",
                                                  color: AppColor.titleColor,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    /*var orderTime =
                                                carOrderTimeToList();
                                            print('Doing test ${orderTime[i]}');
                                            print(
                                                'how many items per row ${itemsPerOrder[i]}');*/
                                                    var orderTime =
                                                        carOrderTimeToList();
                                                    Map<int, CartModel>
                                                        moreOrder = {};
                                                    //comparison
                                                    for (int j = 0;
                                                        j <
                                                            getCartHistoryList
                                                                .length;
                                                        j++) {
                                                      if (getCartHistoryList[j]
                                                              .time ==
                                                          orderTime[i]) {
                                                        moreOrder.putIfAbsent(
                                                            getCartHistoryList[j]
                                                                .id!,
                                                            () => CartModel.fromJson(
                                                                jsonDecode(jsonEncode(
                                                                    getCartHistoryList[
                                                                        j]))));
                                                      }
                                                    }
                                                    Get.find<CartController>()
                                                        .setItems = moreOrder;
                                                    Get.find<CartController>()
                                                        .addToCartList();
                                                    Get.toNamed(
                                                        RouteHelper.cartPage);
                                                  },
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal:
                                                          Dimensions.width10,
                                                      vertical:
                                                          Dimensions.height10 /
                                                              2,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius
                                                          .circular(Dimensions
                                                                  .radius15 /
                                                              2),
                                                      border: Border.all(
                                                          width: 1,
                                                          color: AppColor
                                                              .mainColor),
                                                    ),
                                                    child: SmallText(
                                                      text: 'one more',
                                                      color: AppColor.mainColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                            ],
                          )),
                    ),
                  )
                : Container(
                    height: MediaQuery.of(context).size.height / 1.5,
                    child: const NoDataPage(
                      text: 'You did not buy anything so far !',
                      imgPath: 'assets/images/box.png',
                    ));
          })
        ],
      ),
    );
  }
}
