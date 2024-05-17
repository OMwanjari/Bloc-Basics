import 'package:flutter/material.dart';
import 'package:bloc_demo/features/home/ui/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData(primaryColor: Colors.teal),
    );
  }
}
