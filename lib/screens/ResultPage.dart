import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import '../components/bottom_btn.dart';
import '../components/reusable_card.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String explanation;
  final String resultText;

  ResultPage({this.bmiResult, this.explanation, this.resultText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result', style: titleTextStyle),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              bgColor: activeColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(resultText.toUpperCase(), style: resultTextStyle),
                  Text(bmiResult, style: bmiTextStyle),
                  Text(
                    explanation,
                    style: bodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Bottombtn(
            title: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
