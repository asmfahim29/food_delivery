import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_apps/colors.dart';
import 'package:food_apps/pages/auth/signup_page.dart';
import 'package:food_apps/utils/dimensions.dart';
import 'package:food_apps/widgets/app_text_field.dart';
import 'package:food_apps/widgets/big_text.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();

    var signupImage = ['instagram.png', 'facebook.png', 'google.png'];

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.screenHeight * 0.05,
            ),
            Container(
              child: Center(
                child: CircleAvatar(
                  radius: Dimensions.radius30 +
                      Dimensions.radius30 +
                      Dimensions.radius30 +
                      Dimensions.radius15,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/images/logo.png'),
                ),
              ),
            ),
            Container(
              width: double.maxFinite,
              margin: EdgeInsets.only(left: Dimensions.width20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello',
                    style: TextStyle(
                        fontSize: Dimensions.fontBigS20 * 4,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Sign into your account',
                    style: TextStyle(
                      fontSize: Dimensions.fontBigS20,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
            AppTextField(
              textEditingController: emailController,
              icon: Icons.email_outlined,
              hintText: 'Enter email',
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            AppTextField(
              textEditingController: passwordController,
              icon: Icons.password_sharp,
              hintText: 'Enter password',
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: Dimensions.width20),
                  child: RichText(
                      text: TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.back(),
                          text: "Sign into your account",
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: Dimensions.fontBigS20))),
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.height20 * 3,
            ),
            Container(
              height: Dimensions.screenHeight / 13,
              width: Dimensions.screenWidth / 2.2,
              decoration: BoxDecoration(
                color: AppColor.mainColor,
                borderRadius: BorderRadius.circular(Dimensions.radius30),
              ),
              alignment: Alignment.center,
              child: BigText(
                text: "Sign in",
                size: Dimensions.fontBigS26,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: Dimensions.screenHeight * .05,
            ),
            RichText(
              text: TextSpan(
                  text: "Don\'t have an account?",
                  style: TextStyle(
                      color: Colors.grey[500], fontSize: Dimensions.fontBigS20),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.to(() => SignUpPage(),
                            transition: Transition.fade),
                      text: "Create",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: Dimensions.fontBigS20,
                          fontWeight: FontWeight.bold),
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
