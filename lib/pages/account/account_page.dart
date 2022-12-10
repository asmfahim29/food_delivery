import 'package:flutter/material.dart';
import 'package:food_apps/colors.dart';
import 'package:food_apps/utils/dimensions.dart';
import 'package:food_apps/widgets/acoount_widget.dart';
import 'package:food_apps/widgets/app_icon.dart';
import 'package:food_apps/widgets/big_text.dart';


class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.mainColor,
        centerTitle: true,
        title: BigText(text: 'Profile', size: 25, color: Colors.white,),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.height20),
        child: Column(
          children: [
            //profile icon
            AppIcon(
              icon: Icons.person,
              backgroundColor: AppColor.mainColor,
              iconColor: Colors.white,
              iconSize: Dimensions.height45 + Dimensions.height20 + Dimensions.height20,
              size: Dimensions.height15 * 10,
            ),
            SizedBox(height: Dimensions.height20,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //name widget
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.person,
                        backgroundColor: AppColor.mainColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10 * 5 / 2,
                        size: Dimensions.height10 * 5,
                      ), bigText: BigText(
                        text: 'Abu Saleh Mohammad Fahim'),
                    ),
                    SizedBox(height: Dimensions.height20,),
                    //phone
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.phone_outlined,
                        backgroundColor: AppColor.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10 * 5 / 2,
                        size: Dimensions.height10 * 5,
                      ), bigText: BigText(
                        text: '+8801953439096'),
                    ),
                    SizedBox(height: Dimensions.height20,),
                    //email
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.email_outlined,
                        backgroundColor: AppColor.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10 * 5 / 2,
                        size: Dimensions.height10 * 5,
                      ), bigText: BigText(
                        text: 'asmfahim1@gmail.com'),
                    ),
                    SizedBox(height: Dimensions.height20,),
                    //address
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.location_on,
                        backgroundColor: AppColor.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10 * 5 / 2,
                        size: Dimensions.height10 * 5,
                      ), bigText: BigText(
                        text: 'Fill in your address'),
                    ),
                    SizedBox(height: Dimensions.height20,),
                    //message
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.message_outlined,
                        backgroundColor: AppColor.iconColor2,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10 * 5 / 2,
                        size: Dimensions.height10 * 5,
                      ), bigText: BigText(
                        text: 'Dear fahim, please visit our website'),
                    ),
                    SizedBox(height: Dimensions.height20,),
                    //message
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.work_history,
                        backgroundColor: Colors.purpleAccent,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10 * 5 / 2,
                        size: Dimensions.height10 * 5,
                      ), bigText: BigText(
                        text: 'Software Engineer'),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
