import 'package:bmi_calculator/screens/ResultPage.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/bottom_btn.dart';
import '../components/round_btn.dart';
import '../components/reusable_card.dart';
import 'package:bmi_calculator/cal_bmi.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender activeGender;
  //변하는 값은 final X
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    tapCallback: () {
                      setState(() {
                        activeGender = Gender.male;
                      });
                    },
                    bgColor: activeGender == Gender.male
                        ? activeColor
                        : disableColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.male,
                          color: Colors.white,
                          size: 100,
                        ),
                        Text(
                          'MALE',
                          style: labelTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    tapCallback: () {
                      setState(() {
                        activeGender = Gender.female;
                      });
                    },
                    bgColor: activeGender == Gender.female
                        ? activeColor
                        : disableColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.female,
                          color: Colors.white,
                          size: 100,
                        ),
                        Text(
                          'FEMALE',
                          style: labelTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    bgColor: Color(0xFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('HEIGHT', style: labelTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(
                              height.toString(),
                              style: numberStyle,
                            ),
                            Text(
                              'cm',
                              style: labelTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            activeColor: Colors.yellow,
                            inactiveColor: Colors.grey,
                            thumbColor: Colors.blue,
                            min: 120.0,
                            max: 220.0,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.toInt();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    bgColor: Color(0xFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT', style: labelTextStyle),
                        Text(weight.toString(), style: numberStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconBtn(
                              icon: Icons.remove,
                              onPressedCallback: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(width: 5),
                            RoundIconBtn(
                              icon: Icons.add,
                              onPressedCallback: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    bgColor: Color(0xFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE', style: labelTextStyle),
                        Text(age.toString(), style: numberStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconBtn(
                              icon: Icons.remove,
                              onPressedCallback: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 5),
                            RoundIconBtn(
                              icon: Icons.add,
                              onPressedCallback: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Bottombtn(
            title: 'CALCULATE',
            onTap: () {
              //context : 현재 context (inputPage)
              CalculatorBMI calc =
                  CalculatorBMI(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calc.cal(),
                    resultText: calc.getResult(),
                    explanation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
