import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color darkBgColor = Color(0xFF2F3438);
const Color darkMainColor = Color(0xFF04D9FF);
const Color white = Colors.white;
const Color black = Colors.black;

//TextStyle

TextStyle titleTextStyle({
  Color color = darkMainColor,
  FontWeight fontWeight = FontWeight.w400,
  double fontSize = 14,
}) =>
    GoogleFonts.iceland(
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: 0,
      color: color,
    );

TextStyle subTitleTextStyle({
  Color color = white,
  FontWeight fontWeight = FontWeight.w400,
  double fontSize = 14,
}) =>
    GoogleFonts.amarante(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: 0,
    );
