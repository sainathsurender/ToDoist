import 'package:flutter/material.dart';
import 'package:todoist/screens/home_screeen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ToDoist',
        debugShowCheckedModeBanner: false,
        home: HomeScreen());
  }
}
