import 'package:flutter/widgets.dart';
import 'package:flutter_elements_mapper/src/ui/theme/color_palette.dart';

class SideBar extends StatelessWidget {
  const SideBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .2,
      height: MediaQuery.of(context).size.height,
      color: ColorPalette.whiteGrey,
    );
  }
}