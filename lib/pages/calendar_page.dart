import 'package:flutter/material.dart';
import 'package:proyecto_01/pages/schedule_appointment_page.dart';
import 'package:proyecto_01/utilities/components/custom_appbar.dart';
import 'package:proyecto_01/utilities/meeting.dart';
import 'package:proyecto_01/utilities/meeting_data_source.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarPage extends StatefulWidget {
  CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
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

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar,
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
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 10, 30),
                  child: Text(
                    "Estas son sus consultas del día de hoy",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ),
              ],
            ),
            // Calendario
            Expanded(
              flex: 1,
              child: SfCalendar(
                view: CalendarView.day,
                dataSource: MeetingDataSource(
                  _getDataSource(),
                ),
                timeSlotViewSettings: TimeSlotViewSettings(
                  timeFormat: 'h:mm a',
                  timeIntervalHeight: 80,
                  timeRulerSize: 100,
                  timeTextStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[900],
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
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
