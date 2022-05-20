import 'package:flutter/material.dart';
Widget createRoundedCornerContainer(Widget child) {
  return Container(
    margin: EdgeInsets.all(8),
    child: child,
    decoration: BoxDecoration(
      color: Colors.greenAccent,
        borderRadius: BorderRadius.all(Radius.circular(30))),
    );
}
