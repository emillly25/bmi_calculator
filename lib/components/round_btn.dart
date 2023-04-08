import 'package:flutter/material.dart';

class RoundIconBtn extends StatelessWidget {
  final IconData icon;
  final Function onPressedCallback;

  RoundIconBtn({this.icon, this.onPressedCallback});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      elevation: 6,
      onPressed: onPressedCallback,
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      child: Icon(icon, color: Colors.white, size: 25),
    );
  }
}
