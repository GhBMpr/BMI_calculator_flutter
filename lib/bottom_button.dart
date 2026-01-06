import 'package:bmi_calculator/constaints.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final VoidCallback onPress;
  final String text;


  BottomButton({required this.text,required this.onPress});



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onPress();
      },
      child: Container(
        child: Center(
          child: Text(
            text,
            style: kLargeButtonTextStyle,
          ),
        ),
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: kBottomContainerColor,
        ),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
