import 'package:flutter/material.dart';
import 'package:food_project/Meal%20Info.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SelectMealDate extends StatefulWidget {
  const SelectMealDate({Key? key}) : super(key: key);

  @override
  _SelectMealDateState createState() => _SelectMealDateState();
}

class _SelectMealDateState extends State<SelectMealDate> {

  String mealType = 'Breakfast';
  DateTime selectedDate = DateTime.now();
  bool invalidMeal = false;

  String generateSelectionName() {
    return DateFormat("yyyy-MM-dd").format(selectedDate) + " " + mealType;
  }

  Future<void> searchForSelectedMeal(String requestedMeal) async {
    final prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey(requestedMeal)) {
      print("confirmed: " + requestedMeal);
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MealInfo(mealID: requestedMeal)),
      );
      setState(() {
        invalidMeal = false;
      });
    }
    else {
      print("couldn't find" + requestedMeal);
      setState(() {
        invalidMeal = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Select a date"),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton(
                    onPressed: () async {
                      var date = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2120));
                      setState(() {
                        selectedDate = date!;
                      });
                    },
                    child: const Text("Date"),
                ),
                Text(DateFormat("MM-dd-yyyy").format(selectedDate),
                ),
              ],
            ),
            Column(
              children: [
                ListTile(
                  title: const Text("Breakfast"),
                  leading: Radio(
                    value: "Breakfast",
                    groupValue: mealType,
                    onChanged: (String? value) {
                      setState(() {
                        mealType = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text("Lunch"),
                  leading: Radio(
                    value: "Lunch",
                    groupValue: mealType,
                    onChanged: (String? value) {
                      setState(() {
                        mealType = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text("Dinner"),
                  leading: Radio(
                    value: "Dinner",
                    groupValue: mealType,
                    onChanged: (String? value) {
                      setState(() {
                        mealType = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text("Snack"),
                  leading: Radio(
                    value: "Snack",
                    groupValue: mealType,
                    onChanged: (String? value) {
                      setState(() {
                        mealType = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text("Dessert"),
                  leading: Radio(
                    value: "Dessert",
                    groupValue: mealType,
                    onChanged: (String? value) {
                      setState(() {
                        mealType = value!;
                      });
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          searchForSelectedMeal(generateSelectionName());
    },
          child:  Icon(Icons.search),
    ),
    );
  }
}
