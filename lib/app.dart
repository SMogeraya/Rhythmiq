import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soul_tunes/utils/constants/colors.dart';
import 'package:soul_tunes/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: SAppTheme.lightTheme,
      darkTheme: SAppTheme.darkTheme,

      /// Show Loader or circular progress indicator meanwhile Authentication Repository is decided to show relevent screen
      ///
      home: const Scaffold(
        backgroundColor: SColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
