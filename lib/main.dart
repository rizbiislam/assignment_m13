import 'package:flutter/material.dart';
import 'package:assignment_m13/screens/my_bag_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Bag',
      home: MyBagScreen(),
    );
  }
}
