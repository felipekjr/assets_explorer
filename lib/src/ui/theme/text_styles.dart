import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_color.dart';

class TextStyles {
  static TextStyle header({Color? color}) => GoogleFonts.roboto(
    fontSize: 22,
    color: color ?? AppColor.primary,
    fontWeight: FontWeight.bold,
  );

  static TextStyle medium({Color? color}) => GoogleFonts.roboto(
    fontSize: 16,
    color: color ?? AppColor.primary,
    fontWeight: FontWeight.bold,
  );

  static TextStyle normal({Color? color}) => GoogleFonts.roboto(
    fontSize: 14,
    color: color ?? AppColor.primary,
  );
}