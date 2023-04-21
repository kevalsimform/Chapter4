import 'package:flutter/material.dart';

const titleColor = Color(0xff0b172a);
const subtitleColor = Color(0xff111a2c);
const buttonTitle = Color(0xff020e0d);
const buttonColor = Color(0xffa6fa83);

const logoPath = 'assets/logo.png';
const appleLogoPath = 'assets/apple.png';
const googleLogoPath = 'assets/google.png';

OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(30),
  borderSide: BorderSide(color: Colors.transparent),
);

InputDecoration inputDecoration = InputDecoration(
  contentPadding: EdgeInsets.only(left: 20, right: 20),
  border: outlineInputBorder,
);

Gradient gradient = LinearGradient(colors: [Color(0xff121e32), Color(0xff162036)]);

TextStyle titleStyle = TextStyle(fontSize: 35, fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: titleColor, letterSpacing: 2);

TextStyle subTitleStyle = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.w300,
  color: subtitleColor,
);
