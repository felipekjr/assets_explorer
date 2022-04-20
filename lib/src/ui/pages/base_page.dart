import 'package:flutter/material.dart';

class BasePage extends StatefulWidget {
  const BasePage({ Key? key }) : super(key: key);

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: const [
    
                ]
              )
            ]
          ),
        ),
      ),
    );
  }
}