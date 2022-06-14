import 'package:flutter/material.dart';
import 'package:food_apps/colors.dart';
import 'package:food_apps/utils/dimensions.dart';
import 'package:food_apps/widgets/app_icon.dart';
import 'package:food_apps/widgets/big_text.dart';
import 'package:food_apps/widgets/expandable_text.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back_ios),
                AppIcon(icon: Icons.add_shopping_cart_outlined)
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
                        topRight: Radius.circular(Dimensions.radius20))),
                child: Center(
                    child: BigText(
                  text: "Pitha-Puli",
                  size: Dimensions.fontBigS26,
                )),
              ),
            ),
            pinned: true,
            backgroundColor: Color(0xfff8f6f6),
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/food1.png",
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
                  child: ExpandableText(
                      text:
                          "I was there to have the sudden lunch with my family members."
                          "We selected that restaurant because of Bhorta selection."
                          "The decision we made, that was not wrong! We had huge quantity of Bhorta with rice there, which was very delicious."
                          "Very good classic and quick presentation of them made our lunch quick and satisfactory."
                          "Must try outlet for local classical food (Bhorta) lovers."
                          "I was there to have the sudden lunch with my family members."
                          "We selected that restaurant because of Bhorta selection."
                          "The decision we made, that was not wrong! We had huge quantity of Bhorta with rice there, which was very delicious."
                          "Very good classic and quick presentation of them made our lunch quick and satisfactory."
                          "Must try outlet for local classical food (Bhorta) lovers."
                          "I was there to have the sudden lunch with my family members."
                          "We selected that restaurant because of Bhorta selection."
                          "The decision we made, that was not wrong! We had huge quantity of Bhorta with rice there, which was very delicious."
                          "Very good classic and quick presentation of them made our lunch quick and satisfactory."
                          "Must try outlet for local classical food (Bhorta) lovers."
                          "I was there to have the sudden lunch with my family members."
                          "We selected that restaurant because of Bhorta selection."
                          "The decision we made, that was not wrong! We had huge quantity of Bhorta with rice there, which was very delicious."
                          "Very good classic and quick presentation of them made our lunch quick and satisfactory."
                          "Must try outlet for local classical food (Bhorta) lovers."
                          "I was there to have the sudden lunch with my family members."
                          "We selected that restaurant because of Bhorta selection."
                          "The decision we made, that was not wrong! We had huge quantity of Bhorta with rice there, which was very delicious."
                          "Very good classic and quick presentation of them made our lunch quick and satisfactory."
                          "Must try outlet for local classical food (Bhorta) lovers."
                          "I was there to have the sudden lunch with my family members."
                          "We selected that restaurant because of Bhorta selection."
                          "The decision we made, that was not wrong! We had huge quantity of Bhorta with rice there, which was very delicious."
                          "Very good classic and quick presentation of them made our lunch quick and satisfactory."
                          "Must try outlet for local classical food (Bhorta) lovers."
                          "I was there to have the sudden lunch with my family members."
                          "We selected that restaurant because of Bhorta selection."
                          "The decision we made, that was not wrong! We had huge quantity of Bhorta with rice there, which was very delicious."
                          "Very good classic and quick presentation of them made our lunch quick and satisfactory."
                          "Must try outlet for local classical food (Bhorta) lovers."
                          "I was there to have the sudden lunch with my family members."
                          "We selected that restaurant because of Bhorta selection."
                          "The decision we made, that was not wrong! We had huge quantity of Bhorta with rice there, which was very delicious."
                          "Very good classic and quick presentation of them made our lunch quick and satisfactory."
                          "Must try outlet for local classical food (Bhorta) lovers."),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: Dimensions.width20 * 2.5,
                right: Dimensions.width20 * 2.5,
                top: Dimensions.height10,
                bottom: Dimensions.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.remove,
                  backgroundColor: AppColor.mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.iconSize25,
                ),
                BigText(
                  text: "\$12.88 " " X " " 0 ",
                  color: AppColor.mainBlackColor,
                  size: Dimensions.fontBigS26,
                ),
                AppIcon(
                  icon: Icons.add,
                  backgroundColor: AppColor.mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.iconSize25,
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
                right: Dimensions.width15),
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
                      top: Dimensions.height15,
                      bottom: Dimensions.height15,
                      left: Dimensions.width20,
                      right: Dimensions.width20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white),
                  child: Icon(
                    Icons.favorite,
                    color: AppColor.mainColor,
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
                    text: '\$10 | Add to cart',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
