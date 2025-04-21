import 'package:flutter/material.dart';
import 'package:minimal_shop/Screens/intro_screen.dart';
import 'package:minimal_shop/Themes/theme_provider.dart';
import 'package:minimal_shop/Themes/themes.dart';
import 'package:minimal_shop/Models/cart.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => Cart()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroScreen(),
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: Provider.of<ThemeProvider>(context).themeMode,
    );
  }
}
