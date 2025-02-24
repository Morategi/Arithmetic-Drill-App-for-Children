
import 'package:flutter/material.dart';
import 'package:standard_bank_project/loginPage.dart';

void main() {
  runApp(const ArithmeticDrillApp());
}

class ArithmeticDrillApp extends StatelessWidget {
  const ArithmeticDrillApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arithmetic Drill',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.blue, // Blue background
      ),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

