import 'package:flutter/material.dart';
import 'package:bmi_calculator/ConstatVariable.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({@required this.chiled, this.onPress});
  final Widget chiled;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor: KBorderedColor,
      disabledElevation: 6.0,
      elevation: 6.0,
      shape: CircleBorder(),
      child: chiled,
    );
  }
}
