import 'package:flutter/material.dart';
Widget createRoundedCornerContainer(Widget child) {
  return Container(
    margin: EdgeInsets.all(8),
    child: child,
    decoration: BoxDecoration(
      color: Colors.lightGreen,
        borderRadius: BorderRadius.all(Radius.circular(30))),
    );
}

Widget createTopTextWithColor(String topText, Color topColor, Color textColor)
{
  return Expanded(
      flex: 15,
      child: Container(
        color: topColor,
        alignment: Alignment.center,
        child: Text(
          topText,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontSize: 32,
          ),
        ),
      )
  );
}

Widget gradientMaker(Widget child) {
  return Container(
    margin: EdgeInsets.all(8),
    child: child,
    decoration: BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [Colors.lime,Colors.white])),
  );
}

Widget giveBoxShadow(Widget child) {
  return Container(
    margin: EdgeInsets.all(8),
    child: child,
    decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey ,
              blurRadius: 2.0,
              offset: Offset(2.0,2.0)
          )
        ]
    ),
  );
}

Widget createBorder(Widget child) {
  return Container(
    margin: EdgeInsets.all(8),
    child: child,
    decoration: BoxDecoration(
    border: Border.all(
    color: Colors.black,
      width: 2.0,
    ),
        borderRadius: BorderRadius.circular(1.0)
    ),
  );
}