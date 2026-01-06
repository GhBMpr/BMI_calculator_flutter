import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {

  final Color coleur;
  final Widget cardChild;

  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: coleur,
        ),
        child: cardChild,
      ),
    );
  }

  const ReusableCard({
    required this.coleur,
    required this.cardChild,
    required this.onPress,
  });

}