import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../ConstatVariable.dart';

class MainCard extends StatelessWidget {
  MainCard({@required this.child, this.onTap, this.cardColor = KInActiveColor});
  final List<Widget> child;
  final Function onTap;
  final Color cardColor;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: cardColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: child,
          ),
        ),
      ),
    );
  }
}
