import 'package:flutter/material.dart';

import 'app_color.dart';

class CustomTheme {
  static ThemeData get theme => ThemeData(
    primaryColor: AppColor.primary,
    splashColor: AppColor.secondary,
    highlightColor: AppColor.secondary,
    hintColor: AppColor.greySecondary,
    inputDecorationTheme: InputDecorationTheme(
      hoverColor: AppColor.grey,
      fillColor: AppColor.grey,
      filled: true,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.grey),
        borderRadius: const BorderRadius.all(Radius.circular(15.0))
      ),
    )
  );

  
}

