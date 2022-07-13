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

    double calorieGrade = cal/r_calories;
    double carbGrade = carbs/r_carbs;
    double sodiumGrade = sod/r_sodium;
    double cholesterolGrade = chol/r_cholesterol;
    double fatGrade = fat/r_fat;
    double potassiumGrade = pot/r_potassium;
    double proteinGrade = pro/r_protein;
    double vcGrade = vc/r_vc;

    print("calorie grade: " + calorieGrade.toString());
    print("carbohydrate grade: " + carbGrade.toString());
    print("fat grade: " + fatGrade.toString());
    print("protein grade: " + proteinGrade.toString());
    print("sodium grade: " + sodiumGrade.toString());
    print("potassium grade: " + potassiumGrade.toString());
    print("cholesterol grade: " + cholesterolGrade.toString());
    print("vc grade: " + vcGrade.toString());



    double totalGrade = calorieGrade + carbGrade + sodiumGrade + cholesterolGrade + fatGrade + potassiumGrade;
    double averageGrade = totalGrade/8;
    print("average grade: " + averageGrade.toString());
    return averageGrade;
  }

  String getLetterGrade(double grade)
  {
    if (grade > 0.9) return "A - Wow! You are eating awesome!";
    else if (grade > 0.75) return "B - Great! You are just a step away!";
    else if (grade > 0.5) return "C - Keep going! I believe in you!";
    else if (grade > 0.3) return "D - You are on the way there!";
    else return "F - Hey, everything starts from a poor diet!";
  }

  averageCalories() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getDouble("Average Calories") != null)
    {
      cal = prefs.getDouble("Average Calories")!;

      print(cal);
      setState(() {});
    }
    else{
      cal = 0;
    }
  }


  averageCarbs() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getDouble("Average Carbohydrates") != null)
    {
      carbs = prefs.getDouble("Average Carbohydrates")!;

      print(carbs);
      setState(() {});
    }
    else{
      carbs = 0;
    }
  }
  averageFat() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getDouble("Average Fat") != null)
    {
      fat = prefs.getDouble("Average Fat")!;

      print(fat);
      setState(() {});
    }
    else{
      fat = 0;
    }
  }
  averageCholesterol() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getDouble("Average Cholesterol") != null)
    {
      chol = prefs.getDouble("Average Cholesterol")!;

      print(chol);
      setState(() {});
    }
    else{
      chol = 0;
    }
  }
  averagePotassium() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getDouble("Average Potassium") != null)
    {
      pot = prefs.getDouble("Average Potassium")!;

      print(pot);
      setState(() {});
    }
    else{
      pot = 0;
    }
  }
  averageSodium() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getDouble("Average Sodium") != null)
    {
      sod = prefs.getDouble("Average Sodium")!;

      print(sod);
      setState(() {});
    }
    else{
      sod = 0;
    }
  }
  averageProtein() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getDouble("Average Protein") != null)
      {
        pro = prefs.getDouble("Average Protein")!;

        print(pro);
        setState(() {});
      }
    else{
      //this occurs if the user never ate anything containing this type
      pro = 0;
    }

  }
  averageVc() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getDouble("Average Vitamin C") != null)
    {
      vc = prefs.getDouble("Average Vitamin C")!;

      print(vc);
      setState(() {});
    }
    else{
      vc = 0;
    }
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
                          children:[
                            Container(
                            margin: EdgeInsets.only(top: 10.0, bottom: 30.0, left: 10.0),
                            child: Text("Diet Rating:",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                            Container(
                              margin: EdgeInsets.only(left: 10.0, right: 10.0),
                              child: Text(
                                getLetterGrade(calculateGrade()),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 35.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 35,
              child: FittedBox(
                child: Column(
                  children: [
                    Text("Average calories: "+cal.toString()+" kCal",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                Text("Average carbohydrates: "+carbs.toString()+" g",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                //10: add here
                Text("Average sodium: " +sod.toString()+" mg",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text("Average fat: "+fat.toString()+" g",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text("Average potassium: "+pot.toString()+" mg",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text("Average cholesterol: "+chol.toString()+" mg",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text("Average protein: "+pro.toString()+" g",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text("Average vitamin c: "+vc.toString()+" mg",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                    Row(
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
      ],
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
