import 'package:flutter/material.dart';
import 'package:proyecto_01/home/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromRGBO(106, 99, 242, 1),
        ),
      ),
      title: 'Material App',
      home: HomePage(),
    );
  }
}
