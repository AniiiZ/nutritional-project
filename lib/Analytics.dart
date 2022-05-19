import 'package:flutter/material.dart';
import 'package:food_project/Intake%20Data.dart';

class Analytics extends StatefulWidget {
  const Analytics({Key? key}) : super(key: key);

  @override
  _AnalyticsState createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Analytics"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(TotalIntakeData.getAverageDailyCalories().toString()),
            Text(TotalIntakeData.getAverageDailyCarbs().toString()),
            //10: add here
            Text(TotalIntakeData.getAverageDailySodium().toString()),
            Text(TotalIntakeData.getAverageDailyFat().toString()),
            Text(TotalIntakeData.getAverageDailyPotassium().toString()),
            Text(TotalIntakeData.getAverageDailyCholesterol().toString()),
          ],
        )
      ),
    );
  }
}
