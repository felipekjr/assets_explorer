import 'package:flutter/material.dart';
import 'package:flutter_elements_mapper/src/ui/widgets/widgets.dart';

import '../theme/theme.dart';

class SideBar extends StatelessWidget {
  const SideBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .2,
      height: MediaQuery.of(context).size.height,
      color: AppColor.secondary,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Spacing.x3,
          horizontal: Spacing.x1_half
        ),
        child: Column(
          children: [
            Text(
              'Elements mapper', 
              style: TextStyles.header(color: Colors.white)
            ),
            const SizedBox(height: Spacing.x10),
            itens()
          ]
        ),
      ),
    );
  }

  Widget itens() => Column(
    children: [
      MenuItem(
        label: 'Home',
        icon: const Icon(Icons.home, color: Colors.white),
        onClick: () {},
      ),
      const SizedBox(height: Spacing.x1),
      MenuItem(
        label: 'Settings',
        icon: const Icon(Icons.settings, color: Colors.white),
        onClick: () {},
      ),    
    ],
  );
}

