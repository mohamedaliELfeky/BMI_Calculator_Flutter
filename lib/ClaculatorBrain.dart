import 'dart:math';

import 'package:flutter/cupertino.dart';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});
  final int height;
  final int weight;
  double _BMI;
  String _status, _result;
  String calculateBMI() {
    _BMI = (weight * 1.0 / pow(height / 100, 2));
    return _BMI.toStringAsFixed(1);
  }

  String getStatus() {
    if (_BMI < 18.5)
      _status = 'Underweight';
    else if (_BMI >= 18.5 && _BMI <= 25)
      _status = 'Healthy';
    else if (_BMI <= 29.9)
      _status = 'Overweight';
    else if (_BMI >= 30.0) _status = 'Obese';
    return _status;
  }

  String getResult() {
    if (_status == 'Underweight')
      return 'A BMI of less than 18.5 indicates that you are underweight, so you may need to put on some weight. You are recommended to ask your doctor or a dietitian for advice.';
    else if (_status == 'Healthy')
      return 'A BMI of 18.5-24.9 indicates that you are at a healthy weight for your height. By maintaining a healthy weight, you lower your risk of developing serious health problems.';
    else if (_status == 'Overweight')
      return 'A BMI of 25-29.9 indicates that you are slightly overweight. You may be advised to lose some weight for health reasons. You are recommended to talk to your doctor or a dietitian for advice.';
    else if (_status == 'Obese')
      return 'A BMI of over 30 indicates that you are heavily overweight. Your health may be at risk if you do not lose weight. You are recommended to talk to your doctor or a dietitian for advice.';
  }
}
