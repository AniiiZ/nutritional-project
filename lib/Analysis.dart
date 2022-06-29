import 'package:flutter/material.dart';

import 'Title_Page.dart';
class Analysis extends StatefulWidget {
  const Analysis({Key? key}) : super(key: key);

  @override
  _AnalysisState createState() => _AnalysisState();
}

class _AnalysisState extends State<Analysis> {
  final List<String> entries = <String>['Seafood', 'Vegetables', 'Protein', 'Fruits', 'Dairy'];
  final List<int> colorCodes = <int>[600, 500, 400, 300, 200];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            children: [
            Expanded(
              flex: 10,
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 25.0),
            child: Text("Out of your meal, we found...",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
              Expanded(
                flex: 50,
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(15),
                  itemCount: entries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 80,
                      color: Colors.amber[colorCodes[index]],
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.only(left: 20.0),
                          child: Text('${entries[index]}',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) => const Divider(),
                ),
              ),
              Expanded(
                    flex: 30,
                    child: Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 10),
                      child: Text("Today's total intake",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                ),
              ),
              Expanded(
                  flex: 10,
                  child:Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Diet Rating: 100",
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10.0),
                          child: ElevatedButton(
                              onPressed: () {Navigator.push(
                                    context,
                              MaterialPageRoute(builder: (context) => Title_Page())
                                       );
                                }, child: const Icon(Icons.water_damage_rounded),
                          ),
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
