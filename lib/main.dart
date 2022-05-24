import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'src/ui/pages/pages.dart';
import 'src/ui/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(!kIsWeb && (Platform.isMacOS || Platform.isLinux || Platform.isWindows)) {
    await DesktopWindow.setMinWindowSize(const Size(1200, 600));
  }
  runApp(const FlutterAssetsExplorer());
}

class FlutterAssetsExplorer extends StatelessWidget {
  const FlutterAssetsExplorer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        theme: CustomTheme.theme,
          builder: (context, child) => ResponsiveWrapper.builder(
            child,
            maxWidth: 1200,
            minWidth: 1200,
            defaultScale: true,
            breakpoints: const [
              ResponsiveBreakpoint.resize(480, name: MOBILE),
              ResponsiveBreakpoint.autoScale(800, name: TABLET),
              ResponsiveBreakpoint.resize(1000, name: DESKTOP),
            ],
            background: Container(color: const Color(0xFFF5F5F5))
          ),
        routes: {
          '/': (context) => const HomePage()
        },
      ),
    );
  }

}