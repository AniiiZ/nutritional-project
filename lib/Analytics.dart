import 'package:flutter/material.dart';
import 'package:food_project/Intake%20Data.dart';
import 'package:food_project/Select%20Meal%20Date.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Basic Widgets.dart';
import 'Category.dart';

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
  double pro = 0;
  double vc = 0;

  _AnalyticsState() {
    averageCalories();
    averageCarbs();
    averageSodium();
    averageFat();
    averageCholesterol();
    averagePotassium();
    averageProtein();
    averageVc();
  }

  double calculateGrade () {
    double r_calories = 2000;
    double r_carbs = 200;
    double r_sodium = 1500;
    double r_cholesterol = 300;
    double r_fat = 60;
    double r_potassium = 3000;
    double r_protein = 80;
    double r_vc = 100;

    double calorieGrade = averageCalories()/r_calories;
    double carbGrade = averageCarbs()/r_carbs;
    double sodiumGrade = averageSodium()/r_sodium;
    double cholesterolGrade = averageCholesterol()/r_cholesterol;
    double fatGrade = averageFat()/r_fat;
    double potassiumGrade = averagePotassium()/r_potassium;

    double totalGrade = calorieGrade + carbGrade + sodiumGrade + cholesterolGrade + fatGrade + potassiumGrade;
    double averageGrade = totalGrade/6;
    return averageGrade;
  }

  averageCalories() async {
    final prefs = await SharedPreferences.getInstance();
    cal = prefs.getDouble("Average Calories")!;
    print(cal);

    setState(() {});
  }
  averageCarbs() async {
    final prefs = await SharedPreferences.getInstance();
    carbs = prefs.getDouble("Average Carbohydrates")!;
    print(carbs);

    setState(() {});
  }
  averageFat() async {
    final prefs = await SharedPreferences.getInstance();
    fat = prefs.getDouble("Average Fat")!;
    print(fat);

    setState(() {});
  }
  averageCholesterol() async {
    final prefs = await SharedPreferences.getInstance();
    chol = prefs.getDouble("Average Cholesterol")!;
    print(chol);

    setState(() {});
  }
  averagePotassium() async {
    final prefs = await SharedPreferences.getInstance();
    pot = prefs.getDouble("Average Potassium")!;
    print(pot);

    setState(() {});
  }
  averageSodium() async {
    final prefs = await SharedPreferences.getInstance();
    sod = prefs.getDouble("Average Sodium")!;
    print(sod);
    setState(() {});
  }
  averageProtein() async {
    final prefs = await SharedPreferences.getInstance();
    pro = prefs.getDouble("Average Protein")!;
    print(pro);
    setState(() {});
  }
  averageVc() async {
    final prefs = await SharedPreferences.getInstance();
    vc = prefs.getDouble("Average Vitamin C")!;
    print(vc);
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 30.0),
                child: Text("Welcome!",
                  style: TextStyle(
                    color: Colors.lightGreen,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Expanded(
              flex:40,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10.0, bottom: 30.0),
                      child: createRoundedCornerContainer(
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children:[Container(
                            margin: EdgeInsets.only(top: 10.0, bottom: 30.0, left: 10.0),
                            child: Text("Diet Rating:",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 10.0, bottom: 30.0),
                      child: createRoundedCornerContainer(Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10.0, bottom: 30.0, left: 10.0),
                            child: Text("Advice:",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 50,
              child: Column(
                children: [
                  Text("Average calories: "+cal.toString()+" kCal",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
              Text("Average carbohydrates: "+carbs.toString()+" g",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              //10: add here
              Text("Average sodium: " +sod.toString()+" mg",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text("Average fat: "+fat.toString()+" g",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text("Average potassium: "+pot.toString()+" mg",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text("Average cholesterol: "+chol.toString()+" mg",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text("Average protein: "+pro.toString()+" g",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text("Average vitamin c: "+vc.toString()+" mg",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
      ],
              ),
            ),
          ],
        )
      ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
                heroTag: null,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Category())
                  );
                },
                child: Icon(Icons.add_a_photo)
            ),
            Text("Eat Healthy",
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            FloatingActionButton(
                heroTag: null,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SelectMealDate())
                  );
                },
                child: Icon(Icons.access_time)
            ),
          ],
        )
    );
  }
}
