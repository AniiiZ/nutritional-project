import 'package:flutter/material.dart';

import 'Title_Page.dart';
class Survey extends StatefulWidget {
  const Survey({Key? key}) : super(key: key);

  @override
  _SurveyState createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 10,
              child: Container(
                alignment: Alignment.center,
                child: Text("Hi, User",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 60.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
          ),
          Expanded(
            flex: 80,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Text("Goal",
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text("1. Weight control",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text("Current Weight:",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text("Ideal Weight:",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text("2. Keep healthy",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text("High fiber",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text("Disease",
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text("Diabetes",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text("Heart Disease",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text("Allergy",
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text("Nuts",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                   Text("Seafood",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
          ),
          Expanded(
            flex: 10,
              child:
              Container(
                margin: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Title_Page()),
                        );
                      },
                      child: Text ("Done",
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
              ),
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}
