import 'dart:io';

import 'package:flutter/material.dart';
import '../../../domain/entities/entities.dart';
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
          const SizedBox(height: Spacing.x10),
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
            Stack(
              children: [
                Image.asset(
                  'assets/images/transparent-bg.png',
                  width: 200,
                  height: 150,
                  fit: BoxFit.fill,
                )
              ]
            ),
            const SizedBox(height: Spacing.x2),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'CAMINHO DO ASSET', 
                    style: TextStyles.normal()
                  ),
                  IconButton(
                    onPressed: () {}, 
                    padding: const EdgeInsets.all(0),
                    icon: Icon(
                      Icons.copy, 
                      size: 16,
                      color: AppColor.primary
                    )
                  )
                ],
              )
            ),
            const SizedBox(height: Spacing.x2),
          ]
        )
      );
    }).toList()
  );
}
