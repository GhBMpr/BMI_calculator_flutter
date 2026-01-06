import 'package:flutter/material.dart';
import 'constaints.dart';


class IconContent extends StatelessWidget {
  final IconData icon;
  final String label;
  IconContent(this.icon, this.label);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 50.0,
        ),
        SizedBox(height: 15,),
        Text(label, style: kLabelTextStyle),
      ],
    );
  }
}