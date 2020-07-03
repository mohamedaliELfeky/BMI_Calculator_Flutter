import 'package:flutter/material.dart';
import 'package:bmi_calculator/ConstatVariable.dart';

class GeneralTextStyle extends StatelessWidget {
  GeneralTextStyle({this.size, this.text});
  final String text;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size,
          color: size == KNumberSize ? KNumberColor : KTextColor,
          fontWeight: FontWeight.bold),
    );
  }
}
