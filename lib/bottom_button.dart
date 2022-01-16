

import 'package:flutter/material.dart';

import 'constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.title, required this.onTap});
  String title;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Center(child: Text(title, style: kBottomButtonStyle,)),
        margin: EdgeInsets.only(top: 10),
        color: kBottomContainerColor,
        height: kBottom_container_heght,
        width: double.infinity,
      ),
    );
  }
}