import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/ConstatVariable.dart';
import '../Components/secondLayer.dart';
import '../Components/mainCard.dart';
import '../Components/generalTextStyle.dart';
import '../Components/roundedButton.dart';
import 'SecondPage.dart';
import '../ClaculatorBrain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender;
  int sliderValue = 170;
  int weightValue = 60;
  int ageValue = 18;
  Color bottomBTN = KThumbColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SecondLayer(
              child: <Widget>[
                MainCard(
                  cardColor:
                      gender == Gender.Male ? KActiveColor : KInActiveColor,
                  onTap: () {
                    setState(() {
                      gender = Gender.Male;
                    });
                  },
                  child: <Widget>[
                    FaIcon(
                      FontAwesomeIcons.mars,
                      size: KIconSize,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    GeneralTextStyle(
                      size: KCardFontSize,
                      text: "Male",
                    )
                  ],
                ),
                MainCard(
                  cardColor:
                      gender == Gender.Female ? KActiveColor : KInActiveColor,
                  onTap: () {
                    setState(() {
                      gender = Gender.Female;
                    });
                  },
                  child: <Widget>[
                    FaIcon(
                      FontAwesomeIcons.venus,
                      size: KIconSize,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    GeneralTextStyle(
                      size: KCardFontSize,
                      text: "Female",
                    )
                  ],
                )
              ],
            ),
            MainCard(
              child: <Widget>[
                GeneralTextStyle(
                  text: "Height",
                  size: KCardFontSize,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    GeneralTextStyle(
                      size: KNumberSize,
                      text: sliderValue.toString(),
                    ),
                    GeneralTextStyle(
                      text: "CM",
                      size: 20.0,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      thumbColor: KThumbColor,
                      inactiveTrackColor: KInactiveTrackColor,
                      activeTrackColor: KActiveTrackColor,
                      overlayColor: KOverlayColor,
                      thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15.0, disabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0)),
                  child: Slider(
                    value: sliderValue.toDouble(),
                    min: 0.0,
                    max: 300,
                    onChanged: (double newValue) {
                      setState(() {
                        sliderValue = newValue.toInt();
                      });
                    },
                  ),
                ),
              ],
            ),
            SecondLayer(
              child: <Widget>[
                MainCard(
                  child: <Widget>[
                    GeneralTextStyle(
                      size: KCardFontSize,
                      text: "Wight",
                    ),
                    GeneralTextStyle(
                      text: weightValue.toString(),
                      size: KNumberSize,
                    ),
                    RowOfButton(
                      pressMinusButton: () {
                        setState(() {
                          weightValue--;
                        });
                      },
                      pressPlusButton: () {
                        setState(() {
                          weightValue++;
                        });
                      },
                    ),
                  ],
                ),
                MainCard(
                  child: <Widget>[
                    GeneralTextStyle(
                      size: KCardFontSize,
                      text: "Age",
                    ),
                    GeneralTextStyle(
                      text: ageValue.toString(),
                      size: KNumberSize,
                    ),
                    RowOfButton(
                      pressMinusButton: () {
                        setState(() {
                          ageValue--;
                        });
                      },
                      pressPlusButton: () {
                        setState(() {
                          ageValue++;
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
            RawMaterialButton(
              onPressed: () {
                CalculatorBrain cal =
                    CalculatorBrain(height: sliderValue, weight: weightValue);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecondPage(
                              bmi: cal.calculateBMI(),
                              status: cal.getStatus(),
                              result: cal.getResult(),
                            )));
              },
              shape: RoundedRectangleBorder(),
              fillColor: bottomBTN,
              disabledElevation: 6.0,
              elevation: 0.6,
              child: GeneralTextStyle(
                size: KNumberSize,
                text: "CALCULATE",
              ),
            )
          ],
        ));
  }
}

class RowOfButton extends StatelessWidget {
  RowOfButton({this.pressPlusButton, this.pressMinusButton});
  final Function pressPlusButton;
  final Function pressMinusButton;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        RoundedButton(
          onPress: pressMinusButton,
          chiled: FaIcon(FontAwesomeIcons.minus),
        ),
        RoundedButton(
          onPress: pressPlusButton,
          chiled: FaIcon(FontAwesomeIcons.plus),
        ),
      ],
    );
  }
}
