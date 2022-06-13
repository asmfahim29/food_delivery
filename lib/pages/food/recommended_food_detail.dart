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
                  text: "Sliver app bar",
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppIcon(
                icon: Icons.remove,
                backgroundColor: AppColor.mainColor,
                iconColor: Colors.white,
              ),
              AppIcon(
                icon: Icons.add,
                backgroundColor: AppColor.mainColor,
                iconColor: Colors.white,
              )
            ],
          )
        ],
      ),
    );
  }
}
