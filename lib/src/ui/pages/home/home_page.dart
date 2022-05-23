import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_elements_mapper/src/domain/entities/asset_entity.dart';
import 'package:flutter_elements_mapper/src/ui/theme/button_background_color.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../base_page.dart';

import '../../theme/theme.dart';
import '../../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final assets = [
    AssetEntity(path: 'sasa', fileData: File('')),
    AssetEntity(path: 'sasa/assa', fileData: File('')),
    AssetEntity(path: 'sasa/assa', fileData: File('')),
    AssetEntity(path: 'sasa/assa', fileData: File('')),
    AssetEntity(path: 'sasa/assa', fileData: File('')),
    AssetEntity(path: 'sasa/assa', fileData: File('')),
    AssetEntity(path: 'sasa/assa', fileData: File('')),
    AssetEntity(path: 'sasa/assa', fileData: File('')),
    AssetEntity(path: 'sasa/assa', fileData: File('')),
    AssetEntity(path: 'sasa/assa', fileData: File('')),
    AssetEntity(path: 'sasa/assa', fileData: File('')),

  ];
  @override
  Widget build(BuildContext context) {
    return BasePage(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          topRow(),
          const SizedBox(height: Spacing.x5),
          cards()
        ],
      ),
    );
  }

  Widget topRow() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      title(),
      button(),
      search(),
    ]
  );

  Widget title() => Text('Geral', style: TextStyles.header());

  Widget button() => HoveredAnimatedButton();

  Widget search() => const SizedBox(
    width: 300,
    child: SearchInput()
  );

  Widget cards() =>  GridView.count(
    primary: false,
    crossAxisSpacing: Spacing.x2,
    mainAxisSpacing: Spacing.x4,
    crossAxisCount: 4,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    children: assets.map((e) {
      return CustomCard(
        child: Column(
          children: [
            Container(height: 150, width: 200, color: Colors.grey),
            const SizedBox(height: Spacing.x2),
            Expanded(
              child: Text(
                'CAMINHO DO ASSET', 
                style: TextStyles.normal()
              )
            ),
            const SizedBox(height: Spacing.x2),
          ]
        )
      );
    }).toList()
  );
}


// ignore: must_be_immutable
class HoveredAnimatedButton extends HookWidget {
  bool mouseOn = false;

  HoveredAnimatedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AnimationController animationController = useAnimationController(
      duration: const Duration(milliseconds: 200),
    );
    Animation animation = Tween<double>(
      begin: 8.0, end: 90.0
    ).animate(animationController);

    var mouseOn = useState<bool>(false);

    return MouseRegion(
      onHover: (_) {
        animationController.forward();
        mouseOn.value = true;
      },
      onExit: (_) {
        animationController.reverse();
        mouseOn.value = false;
      },
      child: CustomCard(
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: ButtonBackgroundColor(context),
            overlayColor: ButtonBackgroundColor(context),
            padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.all(Spacing.x2)
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide.none
              )
            )
          ),
          child: Row(
            children: [
              const Icon(
                Icons.add,
                color: Colors.white
              ),
              AnimatedBuilder(
                animation: animation,
                builder: (BuildContext context, Widget? child) {  
                  return Container(
                    height: 20,
                    width: animation.value,
                    child: Opacity(
                      opacity: mouseOn.value ? 1 : 0,
                      child: Text(
                        'Escolher', 
                        style: TextStyles.medium(color: Colors.white)
                      ),
                    ) ,
                  );
                },
               
              )
            ],
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}