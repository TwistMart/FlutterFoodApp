import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  Color backgroundColor;
  final Color iconColor;
  final double size;

  AppIcon({
    super.key,
    required this.icon, // required one
    this.backgroundColor= const Color(0xFFfcf4e4),
    this.iconColor= const Color(0xFF756d54),
    this.size=40


    
    });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
