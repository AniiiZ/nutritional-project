import 'package:flutter/material.dart';
import 'package:food_project/Analytics.dart';
import 'package:food_project/Splash.dart';

import 'Test Menu.dart';
import 'Title_Page.dart';
import 'Analysis.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Analytics(),
    );
  }
}