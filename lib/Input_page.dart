
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double bottom_container_heght= 80;
const activeCardColour= Color(0xFF1D1E33);
const bottomContainerColor= Color(0xFFEB1555);
class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
                    child: ResulableCard(activeCardColour),
                  ),
                  Expanded(
                    child: ResulableCard(activeCardColour)
                  ),
                ],
              )),
              Expanded(child: ResulableCard(activeCardColour)),
              Expanded(child: Row(
                children: [
                  Expanded(
                    child: ResulableCard(activeCardColour),
                  ),
                  Expanded(
                    child: ResulableCard(activeCardColour),
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

class ResulableCard extends StatelessWidget {
  ResulableCard(this.colour);
  Color colour;
  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: colour
    ),);
  }
}