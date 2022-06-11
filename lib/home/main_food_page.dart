import 'package:flutter/material.dart';
import 'package:food_apps/colors.dart';
import 'package:food_apps/widgets/small_text.dart';

import '../widgets/big_text.dart';
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
          Container(
            child: Container(
              margin: EdgeInsets.only(top: 45, bottom: 15),
              padding: EdgeInsets.only(left: 20, right: 20),
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
                      height: 45,
                      width: 45,
                      child: Icon(
                        Icons.search_outlined,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: AppColor.mainColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
          FoodPageBody(),
        ],
      ),
    );
  }
}
