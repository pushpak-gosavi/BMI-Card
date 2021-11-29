
import 'package:bmicalulator/icon_content.dart';
import 'package:bmicalulator/resulable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const double bottom_container_heght= 80;
const activeCardColour= Color(0xFF1D1E33);
const inActiveCardColour= Color(0xFF111328);
const bottomContainerColor= Color(0xFFEB1555);

enum Gender {Male,Female}
class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender ? selectedGender;
  bool isMale=true;
  Color maleCardColor= inActiveCardColour;
  Color femaleCardColor = inActiveCardColour;

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
            children: <Widget>[
              Expanded(child: Row(
                children: [
                  Expanded(
                    child: ResulableCard(
                      onPressed: (){
                        selectedGender= Gender.Male;
                      },
                      //colour: maleCardColor,
                      colour: selectedGender == Gender.Male ? activeCardColour : inActiveCardColour,
                    cardChild: IconContent(icon: FontAwesomeIcons.mars, gender: 'MALE'),),
                  ),
                  Expanded(
                    child: ResulableCard(
                      onPressed: (){
                        selectedGender = Gender.Female;
                      },
                      //colour: femaleCardColor,
                      colour: selectedGender==Gender.Female ? activeCardColour : inActiveCardColour,
                    cardChild: IconContent(icon: FontAwesomeIcons.venus, gender: 'FEMALE'),)
                  ),
                ],
              )),
              Expanded(child: ResulableCard(colour: activeCardColour)),
              Expanded(child: Row(
                children: [
                  Expanded(
                    child: ResulableCard(colour: activeCardColour,
                      cardChild: Column(),),
                  ),
                  Expanded(
                    child: ResulableCard(colour: activeCardColour,
                      cardChild: Column(),),
                  )
                ],
              )),
              Container( color: bottomContainerColor,
              height: bottom_container_heght,
              width: double.infinity,)
            ],
          )
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {  },
      //   child: Icon(Icons.add),
      // ),
    );
  }
}


