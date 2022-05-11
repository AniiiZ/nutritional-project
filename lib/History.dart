import 'package:flutter/material.dart';
import 'package:food_project/Profile.dart';

import 'Title_Page.dart';
class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final List<String> entries = <String>['Breakfast', 'Lunch', 'Dinner', 'Snack', 'Desert'];
  final List<int> colorCodes = <int>[600, 500, 400, 300, 200];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
        children: [
          Expanded(
              flex: 10,
              child: Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 10.0, top: 15.0),
                child: Text("Today's Diet:",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 35,
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: const EdgeInsets.all(15),
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  color: Colors.amber[colorCodes[index]],
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: 20.0),
                      child: Text('${entries[index]}',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 10.0),
            child: Text("Past:",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            ),
          ),
          Expanded(
            flex: 40,
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: const EdgeInsets.all(15),
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50,
                    color: Colors.amber[colorCodes[index]],
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 20.0),
                        child: Text('${entries[index]}',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) => const Divider(),
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
                              MaterialPageRoute(builder: (context) => Profile())
                          );
                        },
                        child: const Icon(Icons.account_circle), ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Title_Page())
                          );
                        },
                        child: const Icon(Icons.water_damage_rounded), )
                    ],
                  )
              ),
          ),
          ],
        ),
    );
  }
}
