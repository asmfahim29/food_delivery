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
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/images/splLogo.png'),
            ),
          ),
        ],
      ),
    );
  }
}
