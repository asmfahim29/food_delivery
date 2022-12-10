import 'package:flutter/material.dart';


class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/images/logo part 1.png'),
            ),
          ),
        ],
      ),
    );
  }
}
