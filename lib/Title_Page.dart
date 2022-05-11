import 'package:flutter/material.dart';
import 'package:food_project/Analytics.dart';
import 'package:food_project/History.dart';

import 'Category.dart';
import 'Profile.dart';
import 'Select Meal Date.dart';
class Title_Page extends StatefulWidget {
  const Title_Page({Key? key}) : super(key: key);

  @override
  _Title_PageState createState() => _Title_PageState();
}

class _Title_PageState extends State<Title_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                   margin: EdgeInsets.only(top: 40.0, bottom: 40.0, left: 10.0),
                    child: ElevatedButton(
                        onPressed: () {  },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children:[Text("Diet Rating:",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                        ),
                      ),
            ),
                  ),
                     Expanded(
                       child: Container(
                     margin: EdgeInsets.only(top: 40.0, bottom: 40.0, right: 10.0),
                      child: ElevatedButton(
                        onPressed: () {  },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [Text("Advice:",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40.0,
                            fontWeight: FontWeight.w500,
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
                flex:5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10.0),
                      child: Text("Today:",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32.0,
                        fontWeight: FontWeight.w500,
                      ),
                  ),
                    ),
                  ],
                  ),
    ),
          Expanded(
              flex: 15,
                child: Container(
                  margin: EdgeInsets.only(left: 10.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("Weight    _________",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300,
                    ),
                    ),
                      Text("Blood Sugar Level    _________",
                        style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w300,
                      ),
                      ),
            ],
              ),
                ),
                ),
            Expanded(
              flex: 20,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Text("Try:",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 35.0,
                            fontWeight: FontWeight.w300,
                          )
                        ),
                        ),
                        Container(
                          height: 110.0,
                            child: Image(image: AssetImage('assets/spinach.jpeg')))
                      ],
                    ),
    ),
            Expanded(
              child: Container(
               margin: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Category())
                    );
                  },
                  child: const Icon(Icons.add_a_photo),
                ),
            ),
            ),
      ],
            ),
    ),
      Expanded(
      flex: 10,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Analytics())
                );
                  },
                child: const Icon(Icons.account_circle), ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SelectMealDate())
                );
              },
              child: const Icon(Icons.access_time), )
          ],
        )
      ),
    ),
      ],
    ),
    );
  }
}

