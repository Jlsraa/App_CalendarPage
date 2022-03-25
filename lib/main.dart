import 'package:flutter/material.dart';
import 'package:proyecto_01/calendar.dart';
import 'package:proyecto_01/calendarApointment.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Calendar(),
    );
  }
}
