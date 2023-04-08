import 'package:flutter/material.dart';
import '../constants.dart';

class Bottombtn extends StatelessWidget {
  final Function onTap;
  final String title;

  Bottombtn({this.onTap, this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom: 20),
        width: double.infinity,
        height: 80,
        color: bottomBarColor,
        child: Center(child: Text(title, style: largeTextStyle)),
      ),
    );
  }
}
