import 'package:flutter/material.dart';

import 'Survey.dart';
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 20,
              child: Container(
                margin: EdgeInsets.only(top: 10.0),
                alignment: Alignment.topCenter,
                child: Text("Let's create an account!",
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
          ),
          Expanded(
            flex: 15,
            child: Container(
              margin: EdgeInsets.only(left: 10.0),
              child: Text("Name:",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 15,
            child: Container(
              margin: EdgeInsets.only(left: 10.0),
              child: Text("Email:",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            ),
          ),
          Expanded(
            flex: 15,
            child: Container(
              margin: EdgeInsets.only(left: 10.0),
              child: Text("Password:",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 20,
            child: Container(
              margin: EdgeInsets.only(top: 50.0, bottom: 50.0, left: 30.0, right: 30.0),
              child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Survey())
                  );
                  },
              child: Text("Continue",
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w500,
              ),
              ),
            ),
            ),
          ),
        ],
      ),
    );
  }
}
