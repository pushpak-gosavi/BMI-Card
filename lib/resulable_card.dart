
import 'package:flutter/material.dart';
class ResulableCard extends StatelessWidget {
  //required this.onPressed
  ResulableCard({required this.colour,  this.cardChild, });
  Widget ?cardChild;
  Color colour;
  //Function  onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour
      ),
      child: cardChild,);
  }
}