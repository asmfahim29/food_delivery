import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_apps/colors.dart';
import 'package:food_apps/widgets/icon_and_text_widget.dart';

import '../widgets/big_text.dart';
import '../widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      height: 320,
      //this pageview.builder acts like carouselSlider.
      child: PageView.builder(
          controller: pageController,
          itemCount: 5,
          itemBuilder: (context, position) {
            return _buildPageItem(position);
          }),
    );
  }

  Widget _buildPageItem(int index) {
    return Stack(
      children: [
        Container(
          //child container takes the whole space of parent container, that's why Parent = 320,
          //child 220 are giving us the same result if we run it. childs height don't nedd.But
          //if we take stack thn we can gave the size of it.
          height: 220,
          margin: EdgeInsets.only(left: 15, right: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: index.isEven ? Color(0xff69c5df) : Color(0xff9294cc),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "assets/images/food2.png",
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 120,
            margin: EdgeInsets.only(left: 30, right: 30, bottom: 35),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
            child: Container(
              padding: EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                    text: 'Vorta-Vat',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      //create list of childrens as many as you do
                      Wrap(
                          children: List.generate(5, (index) {
                        return Icon(
                          Icons.star,
                          color: AppColor.mainColor,
                          size: 15,
                        );
                      })),
                      SizedBox(
                        width: 10,
                      ),
                      SmallText(
                        text: '4.5',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SmallText(
                        text: '1287',
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      SmallText(
                        text: 'comments',
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      IconAndTextWidget(
                        icon: Icons.circle_rounded,
                        iconColor: AppColor.iconColor1,
                        text: 'Normal',
                      ),
                      IconAndTextWidget(
                        icon: Icons.location_on_rounded,
                        iconColor: AppColor.iconColor1,
                        text: '1.7km',
                      ),
                      IconAndTextWidget(
                        icon: Icons.access_time_rounded,
                        iconColor: AppColor.iconColor2,
                        text: '32min',
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
