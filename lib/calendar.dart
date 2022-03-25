import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calendar extends StatefulWidget {
  Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

List<Meeting> _getDataSource() {
  final List<Meeting> meetings = <Meeting>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 15, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));

  // Event
  meetings.add(
    Meeting(
      'Paciente 1',
      startTime,
      endTime,
      Color.fromRGBO(106, 99, 242, 1),
      'Última vez que visitó: 05 de marzo de 2022',
      false,
    ),
  );

  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  String details(int index) {
    return appointments![index].details;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.details,
      this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  String details;
  bool isAllDay;
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(250, 0, 0, 0),
          child: Text(
            'John Doe',
            textAlign: TextAlign.end,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 0, 40, 40),
        child: Column(
          // Bienvenida al usuario con su nombre
          children: [
            Row(
              children: [
                Text(
                  "Bienvenido, John",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 10, 30),
                  child: Text("Estas son sus consultas del día de hoy",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
            // Calendario
            Container(
              height: 500,
              child: SfCalendar(
                view: CalendarView.day,
                dataSource: MeetingDataSource(
                  _getDataSource(),
                ),
                timeSlotViewSettings: TimeSlotViewSettings(
                  timeFormat: 'h:mm a',
                  timeIntervalHeight: 60,
                  timeRulerSize: 100,
                  timeTextStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                cellBorderColor: Colors.transparent,
                todayHighlightColor: Color.fromRGBO(106, 99, 242, 1),
                viewHeaderStyle: ViewHeaderStyle(),
                showCurrentTimeIndicator: true,
                headerDateFormat: 'MMMMEEEEd',
                viewHeaderHeight: 0,
                appointmentTimeTextFormat: 'hh:mm a',
                selectionDecoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                        color: const Color.fromRGBO(106, 99, 242, 1), width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    shape: BoxShape.rectangle),
                appointmentTextStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
