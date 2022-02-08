import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextStyle textStyleNormal = TextStyle(fontSize: 25);
TextStyle textStyleLarge = TextStyle(fontSize: 55, fontWeight: FontWeight.bold);
TextStyle textStyleBold = TextStyle(fontSize: 25, fontWeight: FontWeight.bold);

void openScreen(BuildContext context, Widget screen) {
  Navigator.push(context, MaterialPageRoute(builder: (_) {
    return screen;
  }));
}
