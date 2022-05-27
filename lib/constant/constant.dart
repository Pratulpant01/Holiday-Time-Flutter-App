import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final Color boxColor = Color(0xff3108D3);

final TextStyle titleStyle = GoogleFonts.amiri(
  textStyle: TextStyle(
    letterSpacing: 1,
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  ),
);

final TextStyle descriptionStyle = GoogleFonts.acme(
  textStyle: TextStyle(
    letterSpacing: 1,
    color: Color.fromARGB(255, 158, 192, 250),
    fontSize: 15,
  ),
);

final BoxDecoration boxDecoration1 = BoxDecoration(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(50),
      topLeft: Radius.circular(10),
    ),
    boxShadow: [
      BoxShadow(
        offset: Offset(4, 4),
        color: Color.fromARGB(255, 204, 202, 202),
      ),
      BoxShadow(
        offset: Offset(-3, -3),
        color: Color.fromARGB(255, 204, 202, 202),
      ),
    ],
    color: Colors.white);

final BoxDecoration boxDecoration2 = BoxDecoration(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(10),
      topLeft: Radius.circular(10),
      bottomLeft: Radius.circular(10),
      bottomRight: Radius.circular(10),
    ),
    boxShadow: [
      BoxShadow(
        offset: Offset(4, 4),
        color: Color.fromARGB(255, 232, 231, 231),
      )
    ],
    gradient: LinearGradient(colors: [
      Color(0xff1B1C30),
      Color(0xff0B4256),
    ]));
