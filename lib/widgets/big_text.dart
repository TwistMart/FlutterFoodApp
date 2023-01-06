import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/dimensions.dart';

class BigText extends StatelessWidget {
  Color? color; // by using ? we mean that the color is optional
  final String text;
  double size;
  TextOverflow overflow;

  BigText({
    super.key,
    this.color=const Color(0xFF332d2b), // for default property we can use color like AppColors.mainColor
    required this.text,
    this.size=0,
    this.overflow=TextOverflow.ellipsis
    
    });

  @override
  Widget build(BuildContext context) {
    return Text(     
      maxLines: 1, 
      text,    
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: size==0?Dimensions.font20:size,
      ),
    );
  }
}
