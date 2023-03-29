import 'package:flutter/material.dart';
import 'package:moovbe_bus/screens/splash/introduction_screen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          fontFamily: 'Axiforma',
        ),
        debugShowCheckedModeBanner: false,
        home: const IntroductionScreen());
  }
}