import 'package:flutter/material.dart';

import 'Title_Page.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 40,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30.0),
                    alignment: Alignment.topLeft,
                    width: 200.0,
                    child: Image(image: AssetImage('assets/avatar icon.png')),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30.0),
                    child: Column(
                      children: [Text("Name",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w500,),
                      ),
                        Text("some other info",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w300,),
                        ),
                      ],
                    ),
                  ),
                     ],
              ),
          ),
          Expanded(
              flex: 50,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 15.0),
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Text("Edit",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,),),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text("Goals",
                                  style: TextStyle(
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.w500,),
                                ),
                                Text("1. Lost 20 Ibs",
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w400,),
                                ),
                                Text("2. Eat Vegetables",
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w400,),
                                ),
                              ],
                            ),
                        ),
                      ),
                    ],
                  ),
          ),
          Expanded(
            flex: 10,
            child: Container(
              alignment: Alignment.bottomRight,
                margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Title_Page())
                        );
                      },
                      child: const Icon(Icons.water_damage_rounded),
                    ),
                ),
            ),
        ],
      ),
    );
  }
}
