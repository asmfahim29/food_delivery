import 'package:flutter/material.dart';
import 'package:food_apps/colors.dart';
import 'package:food_apps/utils/dimensions.dart';
import 'package:food_apps/widgets/small_text.dart';

import '../../widgets/big_text.dart';
import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //Header container,
          Container(
            child: Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height45, bottom: Dimensions.height15),
              padding: EdgeInsets.only(
                  left: Dimensions.width20, right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: 'Bangladesh',
                        color: AppColor.mainColor,
                      ),
                      Row(
                        children: [
                          SmallText(
                            text: 'Katherpool',
                            color: Colors.black54,
                          ),
                          Icon(
                            Icons.arrow_drop_down_rounded,
                          )
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      height: Dimensions.height45,
                      width: Dimensions.height45,
                      child: Icon(Icons.search_outlined,
                          color: Colors.white, size: Dimensions.iconSize25),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15),
                          color: AppColor.mainColor),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //Page body,
          const Expanded(
            child: SingleChildScrollView(
              child: FoodPageBody(),
            ),
          ),
        ],
      ),
    );
  }
}
