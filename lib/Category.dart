import 'package:flutter/material.dart';
import 'package:food_project/Basic%20Widgets.dart';
import 'package:food_project/Title_Page.dart';

import 'Classification.dart';
import 'Meal.dart';
class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final List<String> entries = <String>['Breakfast', 'Lunch', 'Dinner', 'Snack', 'Dessert'];
  final List<String> images = <String> ['breakfast icon', 'lunch icon', 'dinner icon 2', 'snack icon 2', 'dessert icon'];
  final List<int> colorCodes = <int>[600, 500, 400, 300, 200];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Title_Page()),
        );
        return false;
      },
      child: Scaffold(
         body: Column(
           children: [
             createTopTextWithColor("What are you scanning for?", Color(0xFF3B7165), Colors.white70),
         Expanded(
           flex: 80,
           child: ListView.separated(
           scrollDirection: Axis.vertical,
           shrinkWrap: true,
         padding: const EdgeInsets.all(15),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF81C54F),
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40),
              ),),
              onPressed: () {
                RecordedData.changeTypeOfMeal(entries[index]);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Meal()),
                );
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 70.0,
                      width: 70,
                      child: Image(image: AssetImage('assets/'+"${images[index]}"+'.png'))),
                  Column(
                  children: [
                    Text("${entries[index]}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w300,
                        ),
                    ),
                  ],
                ),
                ],
                ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
         ),
           ],
         ),
      ),
    );
  }
}
