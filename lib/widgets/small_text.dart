import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;

  //parameterized constructor
  SmallText({
    Key? key,
    //we can't use default color name from appColor class because this is also a constant widget,
    //So it's better to use hexadecimal color for anyConstant widget or class instead of constant name.
    this.color = const Color(0xffccc7c5),
    required this.text,
    this.size = 12,
    this.height = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        // fontFamily: 'Roboto',
        color: color,
        fontSize: size,
        height: height,
      ),
    );
  }
}
