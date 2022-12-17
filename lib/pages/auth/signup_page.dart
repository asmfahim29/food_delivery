import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_apps/base/show_custom_snackbar.dart';
import 'package:food_apps/colors.dart';
import 'package:food_apps/models/signup_body_model.dart';
import 'package:food_apps/utils/dimensions.dart';
import 'package:food_apps/widgets/app_text_field.dart';
import 'package:food_apps/widgets/big_text.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();

    var signupImage = ['instagram.png', 'facebook.png', 'google.png'];

    void _registration() {
      String name = nameController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      String phone = phoneController.text.trim();
      if (name.isEmpty) {
        showCustomSnackBar("Type in your name", title: "Name");
      } else if (phone.isEmpty) {
        showCustomSnackBar("Type in your phone number", title: "Phone number");
      } else if (email.isEmpty) {
        showCustomSnackBar("Type in your email", title: "Email");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar("Type in your valid email address",
            title: "Valid email address");
      } else if (password.isEmail) {
        showCustomSnackBar("Type in your password", title: "Password");
      } else if (password.length < 6) {
        showCustomSnackBar("Password cannot be less than 6", title: "Password");
      } else {
        showCustomSnackBar(
          "All went well",
          title: "Successful",
        );
        SignupBody signupBody = SignupBody(
            name: name, phone: phone, email: email, password: password);
        print(signupBody);
      }
    }

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
            AppTextField(
              textEditingController: nameController,
              icon: Icons.person_outline,
              hintText: 'Enter name',
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            AppTextField(
              textEditingController: phoneController,
              icon: Icons.phone_outlined,
              hintText: 'Enter phone',
            ),
            SizedBox(
              height: Dimensions.height20,
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
            GestureDetector(
              onTap: () {
                _registration();
              },
              child: Container(
                height: Dimensions.screenHeight / 13,
                width: Dimensions.screenWidth / 2.2,
                decoration: BoxDecoration(
                  color: AppColor.mainColor,
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                ),
                alignment: Alignment.center,
                child: BigText(
                  text: "Sign up",
                  size: Dimensions.fontBigS26,
                  color: Colors.white,
                ),
              ),
            ),
            RichText(
                text: TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.back(),
                    text: "Have an account already?",
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: Dimensions.fontBigS20))),
            SizedBox(
              height: Dimensions.screenHeight * .05,
            ),
            RichText(
              text: TextSpan(
                text: "Sign up using one of the following",
                style: TextStyle(
                    color: Colors.grey[500], fontSize: Dimensions.fontBigS16),
              ),
            ),
            Wrap(
              children: List.generate(
                3,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: Dimensions.radius30,
                    backgroundColor: Colors.white,
                    backgroundImage:
                        AssetImage('assets/images/' + signupImage[index]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
