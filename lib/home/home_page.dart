import 'package:flutter/material.dart';
import 'package:proyecto_01/pages/calendar_page.dart';
import 'package:proyecto_01/pages/schedule_appointment_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPageIndex = 0;

  final _pagesNameList = [
    "Home",
    "Schedule",
    "Appointmets",
  ];

  final _pagesList = [
    CalendarPage(),
    ScheduleAppointmentPage(),
    Center(
      child: Text("Appointmets"),
    ),
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
        ],
      ),
    );
  }
}
