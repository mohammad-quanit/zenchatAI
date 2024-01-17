import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenchatai/utils/theme/theme.dart';

import 'package:zenchatai/features/authentication/screens/Onboarding/onboarding.dart';

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
      home: const OnboardingScreen(),
      // supportedLocales: {const Locale('en', ' ')},
    );
  }
}
