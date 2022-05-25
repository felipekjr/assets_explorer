import 'package:flutter/material.dart';

import '../theme/theme.dart';

class PrimaryLoading extends StatelessWidget {
  const PrimaryLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(
      color: AppColor.secondary,
    ));
  }
}
