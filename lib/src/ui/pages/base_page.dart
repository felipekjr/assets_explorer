import 'package:flutter/material.dart';

import '../theme/theme.dart';
import '../widgets/widgets.dart';

class BasePage extends StatefulWidget {
  final Widget content;

  const BasePage({ Key? key, required this.content }) : super(key: key);

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SafeArea(
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SideBar(),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          constraints: BoxConstraints(
                            minHeight: size.height,
                            maxWidth: size.width
                          ),
                          color: AppColor.grey, 
                          child: Padding(
                            padding: const EdgeInsets.all(Spacing.x3),
                            child: widget.content
                          ),
                        ),
                      )
                    )
                  ]
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}