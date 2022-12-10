import 'package:flutter/material.dart';
import 'package:food_apps/widgets/big_text.dart';
import '../utils/dimensions.dart';
import 'app_icon.dart';

class AccountWidget extends StatelessWidget {
  AppIcon appIcon;
  BigText bigText;


  AccountWidget({Key? key, required this.appIcon, required this.bigText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: Dimensions.width15,
          top: Dimensions.width10,
          bottom: Dimensions.width10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            offset: Offset(0, 5),
            color: Colors.blueGrey.withOpacity(0.2)
          )
        ]
      ),
      child: Row(
        children: [
          appIcon,
          SizedBox(width: Dimensions.width10,),
          bigText,
        ],
      ),
    );
  }
}
