import 'package:flutter/material.dart';
class IconContent extends StatelessWidget {
  IconContent({ required this.icon, required this.gender});
  late IconData icon;
  late String gender;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon , size: 80,),
        SizedBox(height: 10,),
        Text(gender, style: TextStyle(fontSize: 18, color: Color(0xFF8D8E98)),)
      ],
    );
  }
}