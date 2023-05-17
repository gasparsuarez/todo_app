import 'package:flutter/material.dart';

class Styles {
  static const firstColor = Color(0xfff953c6);
  static const secondColor = Color(0xffb91d73);

  static const backgroundGradient = BoxDecoration(
      gradient: LinearGradient(
          colors: [firstColor, secondColor], begin: Alignment.topLeft, end: Alignment.bottomRight));

  static final boxContentDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
  );

  static InputDecoration dialogInputDecoration(
      {String? label, String? hintText, IconData? iconData}) {
    return InputDecoration(
      label: Text(label!),
      hintText: hintText,
      filled: true,
      prefixIcon: Icon(iconData, size: 30),
      border: UnderlineInputBorder(borderRadius: BorderRadius.circular(20)),
    );
  }

  static final checkBoxDecoration = BoxDecoration(
    color: Colors.pinkAccent.shade100,
    borderRadius: BorderRadius.circular(20),
  );
}
