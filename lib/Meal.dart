import 'package:flutter/material.dart';
import 'package:food_project/Basic%20Widgets.dart';
import 'package:food_project/Classification.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Analysis.dart';
import 'Category.dart';
import 'Food info.dart';
import 'Intake Data.dart';
import 'Meal Info.dart';

class RecordedData{
  static String typeOfMeal = "";
  static List<FoodInfo> foods = <FoodInfo> [];
  static void changeTypeOfMeal(String newMeal) {
    foods.clear();
    typeOfMeal = newMeal;
  }
  static void removeFood (int index){
    print("removing " + foods[index].name);
    foods.removeAt(index);
  }

  //2
  static MealData generateMealData() {
    MealData m = new MealData(getTotalCalories(), getTotalCarbs(), getTotalSodium(), getTotalFat(),getTotalCholesterol(),getTotalPotassium());
    return m;
  }

  static double getTotalCalories() {
    double total = 0;
    for(FoodInfo f in foods) {
      total += f.calories;
    }
    return total;
  }

  static double getTotalCarbs() {
    double total = 0;
    for(FoodInfo f in foods) {
      total += f.carbohydrates;
    }
    return total;
  }

  //1. Make new method
  static double getTotalSodium(){
    double total = 0;
    for(FoodInfo f in foods) {
      total += f.sodium;
    }
    return total;
  }

  static double getTotalFat(){
    double total = 0;
    for(FoodInfo f in foods) {
      total += f.fat;
    }
    return total;
  }
  static double getTotalCholesterol(){
    double total = 0;
    for(FoodInfo f in foods) {
      total += f.cholesterol;
    }
    return total;
  }
  static double getTotalPotassium(){
    double total = 0;
    for(FoodInfo f in foods) {
      total += f.potassium;
    }
    return total;
  }
}




class Meal extends StatefulWidget {
  const Meal({Key? key}) : super(key: key);

  @override
  _MealState createState() => _MealState();
}

class _MealState extends State<Meal> {
  String generateMealName() {
    String todaysDate = DateFormat("MM-dd-yyyy").format(DateTime.now());
    return todaysDate + " " + RecordedData.typeOfMeal;
  }
  Future<void> _saveName() async {
    final prefs = await SharedPreferences.getInstance();
    String foodNameList = generateMealName();
    List<String> names = <String>[];
    for(FoodInfo f in RecordedData.foods){
      names.add(f.name);
    }
    setState(() {
      prefs.setStringList(foodNameList, names);
    });
    if (prefs.containsKey(foodNameList)) {
      print("Confirmed " + foodNameList);
    }
  }

  Future<void> _saveMeal() async{
    await _saveName();
    MealData m = RecordedData.generateMealData();
    TotalIntakeData.addInfoToday(DateFormat("yyyy-MM-dd").format(DateTime.now()), m);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MealInfo(mealID: generateMealName())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Category()),
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(RecordedData.typeOfMeal),
        ),
        body: Center(
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: const EdgeInsets.all(15),
            itemCount: RecordedData.foods.length,
            itemBuilder: (BuildContext context, int index) {
              return createRoundedCornerContainer(
                Row(
                  children: [
                    ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            RecordedData.removeFood(index);
                          });
                        },
                        icon: Icon(Icons.clear),
                        label: Text(""),
                    ),
                    Text(RecordedData.foods[index].name,
              style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.w400,),
              ),
              ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) => const Divider(),
          ),
        ),
          floatingActionButton: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
              right: 10,
              bottom: 20,
              child: Column(
                children: [
                  FloatingActionButton(
                    heroTag: null,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Classification())
                      );
                    },
                    child: Icon(Icons.add),
                  ),
                  if (RecordedData.foods.length > 0)
                    FloatingActionButton(
                      heroTag: null,
                      onPressed: _saveMeal,
                      child: Icon(Icons.check),
                    ),
                ],
              ),
            ),
        ],
          ),
      ),
    );
  }
}
