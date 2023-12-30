import 'package:flutter/material.dart';
import 'package:zenchatai/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Zenchat AI",
      themeMode: ThemeMode.system,
      theme: ZAppTheme.lightTheme,
      darkTheme: ZAppTheme.darkTheme,
      // supportedLocales: {const Locale('en', ' ')},
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Text(
          'Awesome! 🎊 Zenchat AI is set up and running. \n Happy T Coding 🎊',
          textAlign: TextAlign.center,
        ),
        // appBar: AppBar(title: const Text('Zenchat AI')),
      ),
    );
  }
}
