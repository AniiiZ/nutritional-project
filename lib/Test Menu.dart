import 'package:flutter/material.dart';
class Test_Menu extends StatefulWidget {
  const Test_Menu({Key? key}) : super(key: key);

  @override
  _Test_MenuState createState() => _Test_MenuState();
}

class _Test_MenuState extends State<Test_Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 40,
                child: Container(
                  alignment: Alignment.center,
                  child: Text("SmartDiet",
                      style: TextStyle(
                      color: Colors.lightGreen,
                      fontSize: 80.0,
                      fontWeight: FontWeight.w600,
                  )),
                ),
        ),
          Expanded(
              flex: 40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: ElevatedButton(
                        onPressed: () {  },
                        child: Text("Diet"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: ElevatedButton(
                        onPressed: () {  },
                        child: Text("Health"),
                      ),
                    ),
                  ),
                ],
              ),
          ),
          Expanded(
            flex: 20,
              child: Column(
                children: [
                  Text("About",
                  style: TextStyle(
    color: Colors.lightGreenAccent,
    fontSize: 50.0,
    fontWeight: FontWeight.w300,)),
                  Text("Hello",
                      style: TextStyle(
                        color: Colors.lightGreenAccent,
                        fontSize: 50.0,
                        fontWeight: FontWeight.w300,)),
                ],
              ),
          ),
        ],
      ),
    );
  }
}
