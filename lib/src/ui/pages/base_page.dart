import 'package:flutter/material.dart';
import 'package:flutter_elements_mapper/src/ui/widgets/widgets.dart';

class BasePage extends StatefulWidget {
  final Widget content;

  const BasePage({ Key? key, required this.content }) : super(key: key);

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
              const Navbar(),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SideBar(),
                    Expanded(child: widget.content)
                  ]
                ),
              )
            ]
          ),
        ),
      ),
    );
  }
}