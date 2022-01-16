
import 'package:bmicalulator/constants.dart';
import 'package:bmicalulator/resulable_card.dart';
import 'package:flutter/material.dart';

import 'bottom_button.dart';

class ResultPage extends StatefulWidget {
  ResultPage({Key? key,required this.resultText, required this.bmiResult, required this.interpretation});
  final String resultText;
  final String bmiResult;
  final String interpretation;

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
            padding: EdgeInsetsDirectional.all(15),
            alignment: Alignment.bottomLeft,
            child: Text('Your Result', style: kResultText),

          ),),
          Expanded(
            flex: 5,
            child: ResulableCard(colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    Text(widget.resultText.toUpperCase(), style: kResultTextStyle,),
                  Text(widget.bmiResult, style: kBMITextStyle,),
                  Text(widget.interpretation, style: kLableTextStyle,textAlign: TextAlign.center,)
                ],
              ),
          ),),
          BottomButton(title: 'RE-CALCULATE', onTap: (){
            setState(() {
              Navigator.pop(context);
            });},)
        ],
      ),
    );
  }
}

