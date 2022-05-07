import 'package:flutter/material.dart';
import 'package:proyecto_01/content/appointments/appointment_page.dart';
import '../content/Day_Calendar/calendar_page.dart';
import '../content/Schedule/schedule_appointment_page.dart';
import '../content/patients/patients_page.dart';

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
    AppointmentPage(),
    PatientsPage(),
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
