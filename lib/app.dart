import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenchatai/bindings/general_bindings.dart';
import 'package:zenchatai/utils/constants/colors.dart';
import 'package:zenchatai/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Zenchat AI",
      themeMode: ThemeMode.system,
      theme: ZAppTheme.lightTheme,
      darkTheme: ZAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: GeneralBindings(),
      home: const Scaffold(
        backgroundColor: ZColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: ZColors.white,
          ),
        ),
      ),
      // supportedLocales: {const Locale('en', ' ')},
    );
  }
}
