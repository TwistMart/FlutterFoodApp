import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  Color? color; // by using ? we mean that the color is optional
  final String text;
  double size;
  double height;

  SmallText({
    super.key,
    this.color = const Color(0xFFccc7c5),// for default property we cannot  use color like AppColors.mainColor instead we use == const Color(0xFFccc7c5);
    required this.text,
    this.size = 12,
    this.height=1.2,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Roboto', 
        color: color, 
        fontSize: size,
        height: height
      ),
    );
  }
}
