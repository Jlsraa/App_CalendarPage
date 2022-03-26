import 'package:flutter/material.dart';
import 'package:proyecto_01/pages/calendar_page.dart';
import 'package:proyecto_01/pages/patient_info.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: CalendarPage(),
    );
  }
}
