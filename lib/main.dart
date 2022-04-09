import 'package:flutter/material.dart';
import 'package:proyecto_01/content/profile/profile.dart';
import 'package:proyecto_01/home/home_page.dart';
<<<<<<< HEAD
=======
// import 'package:proyecto_01/pages/calendar_page.dart';
// import 'package:proyecto_01/pages/patient_info.dart';
>>>>>>> b2ca5e543eb655937d74021cc0542b2f9b98303a

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
      home: Profile(),
    );
  }
}
