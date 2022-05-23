import 'package:flutter/material.dart';

import 'app_color.dart';

class ButtonBackgroundColor implements MaterialStateProperty<Color?> {
  final BuildContext context;

  ButtonBackgroundColor(this.context);

  @override
  Color? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return AppColor.primary;
    }
    return AppColor.secondary;
  }
  
}