import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Food Dictionary.dart';
import 'Food info.dart';
class MealInfo extends StatefulWidget {

  final String mealID;

  const MealInfo({Key? key, required this.mealID}) : super(key: key);

  @override
  _MealInfoState createState() => _MealInfoState();
}

class _MealInfoState extends State<MealInfo> {

  List<String> loadedMealNames = [];
  List<FoodInfo> mealInfo = [];

  @override
  void initState(){
    super.initState();
    _retreiveFoodInfo();
  }

  Future<void> _retreiveFoodInfo() async {
    final prefs = await SharedPreferences.getInstance();

    if(!prefs.containsKey(widget.mealID)){
     return;
    }

    setState(() {
      loadedMealNames = prefs.getStringList(widget.mealID)!;
      for(String s in loadedMealNames){
        mealInfo.add(getCorrespondingFood(s));
      }
      if (mealInfo != null) print("successfully loaded meal");
    });
  }
  FoodInfo getCorrespondingFood(String foodName){
    switch(foodName){
      case "Steak":
        return FoodDictionary.allFoods["Steak"]!;
      case "Chocolate":
        return FoodDictionary.allFoods["Chocolate"]!;
      case "Fish":
        return FoodDictionary.allFoods["Fish"]!;
      case "Lettuce":
        return FoodDictionary.allFoods["Lettuce"]!;
      case "Banana":
        return FoodDictionary.allFoods["Banana"]!;
      case "Taco":
        return FoodDictionary.allFoods["Taco"]!;
      case "Cookie":
        return FoodDictionary.allFoods["Cookie"]!;
      case "Cake":
        return FoodDictionary.allFoods["Cake"]!;
      case "Corn":
        return FoodDictionary.allFoods["Corn"]!;
      case "Tomato":
        return FoodDictionary.allFoods["Tomato"]!;
      case "Potato":
        return FoodDictionary.allFoods["Potato"]!;
      case "Celery":
        return FoodDictionary.allFoods["Celery"]!;
      case "Apple":
        return FoodDictionary.allFoods["Apple"]!;
      case "Sandwich":
        return FoodDictionary.allFoods["Sandwich"]!;
      case "Egg":
        return FoodDictionary.allFoods["Egg"]!;
      case "Pasta":
        return FoodDictionary.allFoods["Pasta"]!;
      case "Rice":
        return FoodDictionary.allFoods["Rice"]!;
      case "Ice Cream":
        return FoodDictionary.allFoods["Ice Cream"]!;
      case "Pizza":
        return FoodDictionary.allFoods["Pizza"]!;
      case "Cheese":
        return FoodDictionary.allFoods["Cheese"]!;
      default:
        return FoodInfo("Null", 0, 0, 0, 0, 0, 0);
    }
  }

  Container createFoodInfoWidget (FoodInfo f){
    return Container(
      height: 60,
      color: Colors.lime,
      child: Column(
        children: [
          Text(f.name),
          Text(f.calories.toString()),
        ]
      )
    );
  }

  double getCalorieTotal(){
    double total = 0;
    for(FoodInfo f in mealInfo){
      total += f.calories;
    }
    return total;
  }

  double getCholesterolTotal(){
    double total = 0;
    for(FoodInfo f in mealInfo){
      total += f.cholesterol;
    }
    return total;
  }

  double getFatTotal(){
    double total = 0;
    for(FoodInfo f in mealInfo){
      total += f.fat;
    }
    return total;
  }

  double getCarbohydratesTotal(){
    double total = 0;
    for(FoodInfo f in mealInfo){
      total += f.carbohydrates;
    }
    return total;
  }

  double getSodiumTotal(){
    double total = 0;
    for(FoodInfo f in mealInfo){
      total += f.sodium;
    }
    return total;
  }

  double getPotassiumTotal(){
    double total = 0;
    for(FoodInfo f in mealInfo){
      total += f.potassium;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mealID),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 50,
              child: ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: mealInfo.length,
                itemBuilder: (BuildContext context, int index) {
                  return createFoodInfoWidget(mealInfo[index]);
                },
                separatorBuilder: (BuildContext context, int index) => const Divider(),
              ),
            ),
            Expanded(
              flex: 50,
                child: Column(
                  children: [
                    Text("Analysis",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    Text("Total calories: " + getCalorieTotal().toString() + " kcal"),
                    Text("Total cholesterol: " + getCholesterolTotal().toString() + " mg"),
                    Text("Total fat: " + getFatTotal().toString() + " g"),
                    Text("Total carbohydrate: " + getCarbohydratesTotal().toString() + " g"),
                    Text("Total sodium: " + getCarbohydratesTotal().toString() + " mg"),
                    Text("Total potassium: " + getCarbohydratesTotal().toString() + " mg"),
                  ],
                )
            )
          ],
        )
      )
    );
  }
}
