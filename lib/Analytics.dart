import 'package:flutter/material.dart';
import 'package:food_project/Intake%20Data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Analytics extends StatefulWidget {
  const Analytics({Key? key}) : super(key: key);

  @override
  _AnalyticsState createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> {
  double cal = 0;
  double chol = 0;
  double fat = 0;
  double sod = 0;
  double carbs = 0;
  double pot = 0;

  _AnalyticsState() {
    totalCalories();
    totalCarbs();
    totalSodium();
    totalFat();
    totalCholesterol();
    totalPotassium();
  }

  totalCalories() async {
    final prefs = await SharedPreferences.getInstance();
    cal = prefs.getDouble("Average Calories")!;
    print(cal);

    setState(() {});
  }
  totalCarbs() async {
    final prefs = await SharedPreferences.getInstance();
    carbs = prefs.getDouble("Average Carbohydrates")!;
    print(carbs);

    setState(() {});
  }
  totalFat() async {
    final prefs = await SharedPreferences.getInstance();
    fat = prefs.getDouble("Average Fat")!;
    print(fat);

    setState(() {});
  }
  totalCholesterol() async {
    final prefs = await SharedPreferences.getInstance();
    chol = prefs.getDouble("Average Cholesterol")!;
    print(chol);

    setState(() {});
  }
  totalPotassium() async {
    final prefs = await SharedPreferences.getInstance();
    pot = prefs.getDouble("Average Potassium")!;
    print(pot);

    setState(() {});
  }
  totalSodium() async {
    final prefs = await SharedPreferences.getInstance();
    sod = prefs.getDouble("Average Sodium")!;
    print(sod);

    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Analytics"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(cal.toString()),
            Text(carbs.toString()),
            //10: add here
            Text(sod.toString()),
            Text(fat.toString()),
            Text(pot.toString()),
            Text(chol.toString()),
          ],
        )
      ),
    );
  }
}
