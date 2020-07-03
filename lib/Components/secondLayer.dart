import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SecondLayer extends StatelessWidget {
  SecondLayer({@required this.child});
  final List<Widget> child;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: child,
      ),
    );
  }
}
