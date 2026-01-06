import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constaints.dart';
import 'reusable_round_icon_button.dart';
import 'bottom_button.dart';


enum Gender{
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height=180;
  int weight=60;
  int age=18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    coleur:selectedGender==Gender.male?kActiveCardColor:kInactiveCardColor,
                    cardChild: IconContent(FontAwesomeIcons.mars,'MALE'),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    coleur:selectedGender==Gender.female?kActiveCardColor:kInactiveCardColor,
                    cardChild: IconContent(FontAwesomeIcons.venus,'FEMALE'),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  )
                ),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
                  coleur:kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('HEIGHT', style: kLabelTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(height.toString(),style: kNumbersTextStyle,),
                          SizedBox(width: 10,),
                          Text('cm', style: kLabelTextStyle,)
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTickMarkColor: Colors.white,
                          inactiveTickMarkColor: Color(0xFF8D8E98),
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 23),
                          thumbColor: kBottomContainerColor,
                          overlayColor: Color(0x29EB1555),
                        ),
                        child: Slider(
                            value: height.toDouble(),
                            min: 120,
                            max: 220,
                            onChanged: (double newV){
                              setState(() {
                                height=newV.round();
                              });
                            }
                        ),
                      )
                    ],
                  ),
                  onPress: (){},
              )
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                        coleur: kActiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('WEIGHT', style: kLabelTextStyle,),
                            Text(weight.toString(), style: kNumbersTextStyle,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: Icons.remove,
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                                const SizedBox(width: 25.0),
                                RoundIconButton(
                                  icon: Icons.add,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                              ],
                            ),

                          ],
                        ),
                        onPress: (){},
                    )
                ),
                Expanded(
                    child: ReusableCard(
                        coleur: kActiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('AGE', style: kLabelTextStyle,),
                            Text(age.toString(), style: kNumbersTextStyle,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: Icons.remove,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                                const SizedBox(width: 25.0),
                                RoundIconButton(
                                  icon: Icons.add,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                              ],
                            ),

                          ],
                        ),
                        onPress: (){}
                    )
                ),
              ],
            ),
          ),
          BottomButton(
            text: 'CALCULATE BMI',
            onPress: () {
              CalculatorBrain calc = CalculatorBrain(
                height: height,
                weight: weight,
              );

              final bmiResult = calc.calculateBMI();
              final resultText = calc.getResult();
              final interpretation = calc.getInterpretation();

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResults: bmiResult,
                    resultText: resultText,
                    interpretation: interpretation,
                  ),
                ),
              );
            },

          ),
        ],
      )
    );
  }
}

