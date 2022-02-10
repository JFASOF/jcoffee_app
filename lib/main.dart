import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jcoffee_app/screens/coffee_list_screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Coffee',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CoffeeListScreen(),
    );
  }
}