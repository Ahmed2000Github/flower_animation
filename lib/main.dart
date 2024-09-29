import 'package:flower_animation/pages/flower_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flower Animation Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const FlowerPage(),
    );
  }
}
