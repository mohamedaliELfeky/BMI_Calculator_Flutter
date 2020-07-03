import 'package:bmi_calculator/ConstatVariable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../Components/generalTextStyle.dart';

class SecondPage extends StatelessWidget {
  SecondPage(
      {@required this.bmi, @required this.result, @required this.status});
  final String bmi, status, result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.all(15.0),
            child: Text(
              "Your Result",
              style: TextStyle(fontSize: 40),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: KInActiveColor, shape: BoxShape.rectangle),
              margin: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    status,
                    style:
                        TextStyle(fontSize: KCardFontSize, color: KNormalColor),
                  ),
                  GeneralTextStyle(
                    text: bmi,
                    size: KNumberSize,
                  ),
                  Text(
                    KNormalWeight,
                    style: KStatusStyle,
                  ),
                  Text(
                    result,
                    style: KResultStyle,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
