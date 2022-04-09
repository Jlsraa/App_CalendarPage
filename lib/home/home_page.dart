import 'package:flutter/material.dart';
<<<<<<< HEAD
import '../content/Day_Calendar/calendar_page.dart';
import '../content/Schedule/schedule_appointment_page.dart';
=======
import 'package:proyecto_01/pages/calendar_page.dart';
import 'package:proyecto_01/pages/patients_page.dart';
import 'package:proyecto_01/pages/schedule_appointment_page.dart';
>>>>>>> b2ca5e543eb655937d74021cc0542b2f9b98303a

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPageIndex = 0;

  final _pagesNameList = ["Home", "Schedule", "Appointmets", "Patients"];

  final _pagesList = [
    CalendarPage(),
    ScheduleAppointmentPage(),
<<<<<<< HEAD
    Center(
      child: Text("Appointmets"),
    ),
    Center(
      child: Text("Patients"),
    ),
=======
    PatientsPage(),
>>>>>>> b2ca5e543eb655937d74021cc0542b2f9b98303a
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentPageIndex,
        children: _pagesList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentPageIndex,
        onTap: (index) {
          setState(
            () {
              _currentPageIndex = index;
            },
          );
        },
        items: [
          BottomNavigationBarItem(
            label: _pagesNameList[0],
            icon: Icon(Icons.home_rounded),
          ),
          BottomNavigationBarItem(
            label: _pagesNameList[1],
            icon: Icon(Icons.calendar_month_outlined),
          ),
          BottomNavigationBarItem(
            label: _pagesNameList[2],
            icon: Icon(Icons.schedule_rounded),
          ),
          BottomNavigationBarItem(
            label: _pagesNameList[3],
            icon: Icon(Icons.people_outline_outlined),
          ),
        ],
      ),
    );
  }
}
