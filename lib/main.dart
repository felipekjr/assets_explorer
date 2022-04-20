import 'package:flutter/material.dart';

import 'src/ui/pages/pages.dart';

void main() {
  runApp(FlutterElementsMapper());
}

class FlutterElementsMapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.lightBlue
      ),
      routes: {
        '/': (context) => const HomePage()
      },
    );
  }

}