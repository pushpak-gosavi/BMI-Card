
import 'package:flutter/material.dart';
class ResulableCard extends StatelessWidget {
  ResulableCard({required this.colour,  this.cardChild,  this.onPressed});
  Widget ?cardChild;
  Color colour;
  Function ? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed!(),
      child: Container(margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: colour
        ),
        child: cardChild,),
    );
  }
}