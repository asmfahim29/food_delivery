import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_apps/widgets/small_text.dart';

import '../colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimensions.fontBigS26,
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          children: [
            //create list of childrens as many as you do
            Wrap(
                children: List.generate(5, (index) {
              return const Icon(
                Icons.star,
                color: AppColor.mainColor,
                size: 15,
              );
            })),
            const SizedBox(
              width: 10,
            ),
            SmallText(
              text: '4.5',
            ),
            const SizedBox(
              width: 10,
            ),
            SmallText(
              text: '1287',
            ),
            const SizedBox(
              width: 5,
            ),
            SmallText(
              text: 'comments',
            )
          ],
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            IconAndTextWidget(
              icon: Icons.circle_rounded,
              iconColor: AppColor.iconColor1,
              text: 'Normal',
            ),
            IconAndTextWidget(
              icon: Icons.location_on_rounded,
              iconColor: AppColor.mainColor,
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
    );
  }
}
