import 'package:flutter/material.dart';
import 'package:flutter_cookbook/screens/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chapter 4 Practical',
        theme : ThemeData(
          fontFamily: 'Dongle',
        ),
      home: const OnboardingScreen(),
    );
  }
}

