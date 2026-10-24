import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task1/screens/mainScreen.dart';

import 'models/productModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: const MainScreen());
  }
}
