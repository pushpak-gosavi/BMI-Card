import 'package:bmicalulator/calculator_brain.dart';
import 'package:bmicalulator/icon_content.dart';
import 'package:bmicalulator/resulable_card.dart';
import 'package:bmicalulator/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'bottom_button.dart';
import 'constants.dart';

enum Gender { Male, Female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  bool isMale = true;
  Color maleCardColor = kInActiveCardColour;
  Color femaleCardColor = kInActiveCardColour;
  int height = 180;
  int weight = 60;
  int age = 25;

  // void updatedColor(Gender selectedGender){
  //   if(selectedGender == Gender.Male){
  //     if(maleCardColor==inActiveCardColour){
  //       maleCardColor=activeCardColour;
  //       femaleCardColor=inActiveCardColour;
  //     }else maleCardColor = inActiveCardColour;
  //   }
  //   if(selectedGender == Gender.Female){
  //     if(femaleCardColor==inActiveCardColour){
  //       femaleCardColor=activeCardColour;
  //       maleCardColor=inActiveCardColour;
  //     }else femaleCardColor=inActiveCardColour;
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI calculator'),
      ),
      body: SafeArea(
        child: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.Male;
                      });
                    },
                    child: ResulableCard(
                      //colour: maleCardColor,
                      colour: selectedGender == Gender.Male
                          ? kActiveCardColour
                          : kInActiveCardColour,
                      cardChild: IconContent(
                          icon: FontAwesomeIcons.mars, gender: 'MALE'),
                    ),
                  ),
                ),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.Female;
                    });
                  },
                  child: ResulableCard(
                    //colour: femaleCardColor,
                    colour: selectedGender == Gender.Female
                        ? kActiveCardColour
                        : kInActiveCardColour,
                    cardChild: IconContent(
                        icon: FontAwesomeIcons.venus, gender: 'FEMALE'),
                  ),
                )),
              ],
            )),
            Expanded(
                child: ResulableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: kLableTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kBigText,
                      ),
                      Text(
                        'cm',
                        style: kLableTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 16),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                    ),
                    child: Slider(
                      min: 120.0,
                      max: 220.0,
                      value: height.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ResulableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: kLableTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kBigText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularIconButton(iconData:FontAwesomeIcons.minus,
                            funOnPressed: (){
                              setState(() {
                                weight--;
                              });
                            },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            CircularIconButton(iconData : FontAwesomeIcons.plus, funOnPressed: (){
                              setState(() {
                                weight++;
                              });
                            },),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ResulableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: kLableTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kBigText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularIconButton(iconData:FontAwesomeIcons.minus,
                              funOnPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            CircularIconButton(iconData : FontAwesomeIcons.plus, funOnPressed: (){
                              setState(() {
                                age++;
                              });
                            },),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
            BottomButton(title: 'CALCULATE', onTap: (){
              CalculatorBrain calBmi = CalculatorBrain(height: height, weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  ResultPage( bmiResult: calBmi.calculateBMI(),
                    resultText: calBmi.getResult(),
                  interpretation:  calBmi.getInterpretation(),)));
              },)
          ],
        )),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {  },
      //   child: Icon(Icons.add),
      // ),
    );
  }
}


class CircularIconButton extends StatelessWidget {
  CircularIconButton({required this.iconData, required this.funOnPressed});

  IconData iconData;
  final VoidCallback funOnPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(iconData),
      elevation: 0.0,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor: Color(0xFF4C4E5F),
      onPressed: funOnPressed,
    );
  }
}
