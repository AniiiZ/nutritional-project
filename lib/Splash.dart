import 'package:flutter/material.dart';

import 'Register.dart';
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 15,
            child: Container(
              margin: EdgeInsets.only(top: 15.0),
              child: Text("SmartDiet",
              style: TextStyle(
                fontSize: 70.0,
                fontWeight: FontWeight.w500,
                color: Colors.green,
              ),
            ),
            ),
          ),
          Expanded(
              flex: 65,
              child: Container(
                alignment: Alignment.center,
                  height: 100.0,
                  child: Image(image: AssetImage('assets/food icon.jpeg'))),
          ),
          Expanded(
              flex: 20,
              child: Container(
                margin: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Sign in"),
                    ),
                    ElevatedButton(
                      onPressed: () {Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Register())
                      );
                        },
                        child: Text("First Time User"),
                    ),
                  ],
                ),
              ),
          ),
        ],
      ),
    );
  }
}
