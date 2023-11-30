import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppConstant {
  static Color appbarcolor = Colors.grey;

  static Color backgroundcolor = const Color.fromRGBO(224, 224, 224, 1);

  static TextStyle font_roboto = GoogleFonts.roboto(
    fontSize: 40,
    color: Colors.grey[700],
  );
  static TextStyle font_roboto2 = GoogleFonts.roboto(
    fontSize: 24,
    color: Colors.grey[700],
  );

  static TextStyle textError = TextStyle(
    color: Colors.red[300],
    fontSize: 16,
    fontStyle: FontStyle.italic,
  );

  static TextStyle textlink = TextStyle(
    color: Colors.grey[600],
    fontSize: 16,
  );

  static TextStyle textbody = TextStyle(
    color: Colors.grey.shade500,
    fontSize: 16,
  );

  static TextStyle textbodyfocus = const TextStyle(
    color: Colors.grey,
    fontSize: 20,
  );
}
