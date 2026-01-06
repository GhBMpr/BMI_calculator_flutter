import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

import 'bottom_button.dart';
import 'constaints.dart';
class ResultsPage extends StatelessWidget {

  final String bmiResults, resultText, interpretation;

  const ResultsPage({
    required this.bmiResults,
    required this.resultText,
    required this.interpretation,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: Text('Your Result',style: kTitleTextStyle,),
            ),
          ),
          Expanded(
            flex: 5,
              child: ReusableCard(
                coleur: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(resultText,style: kResultTextStyle,),
                    Text(bmiResults,style: kBMITextStyle,),
                    Text(interpretation,textAlign: TextAlign.center,style: kbodyTextStyle,),
                  ],
                ),
                onPress: (){

                },
              )
          ),
          BottomButton(
            text: 'RECALCULATE',
            onPress: (){
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
