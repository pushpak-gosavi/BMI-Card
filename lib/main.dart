import 'package:flutter/material.dart';

import 'Input_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xFF0A0E21),
          textTheme: TextTheme(bodyText1: TextStyle(color: Color(0xFFFFFFFF))),
          primaryColor: Color(0xFF0A0E21)
      ),
      home: InputPage()
    );
  }
}


