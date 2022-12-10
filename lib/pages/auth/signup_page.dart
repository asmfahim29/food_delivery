import 'package:flutter/material.dart';
import 'package:food_apps/colors.dart';
import 'package:food_apps/utils/dimensions.dart';
import 'package:food_apps/widgets/app_text_field.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: Dimensions.screenHeight * 0.05,
          ),
          Container(
            child: Center(
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/images/splashLogo.png'),
              ),
            ),
          ),
          AppTextField(
            textEditingController: emailController,
            icon: Icons.email_outlined,
            hintText: 'Enter email',
          ),
          SizedBox(
            height: Dimensions.height35,
          ),
          AppTextField(
            textEditingController: passwordController,
            icon: Icons.password_sharp,
            hintText: 'Enter password',
          ),
          SizedBox(
            height: Dimensions.height35,
          ),
          AppTextField(
            textEditingController: nameController,
            icon: Icons.person_outline,
            hintText: 'Enter name',
          ),
          SizedBox(
            height: Dimensions.height35,
          ),
          AppTextField(
            textEditingController: phoneController,
            icon: Icons.phone_outlined,
            hintText: 'Enter phone',
          ),
          SizedBox(
            height: Dimensions.height35,
          ),
        ],
      ),
    );
  }
}
