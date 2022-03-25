import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarAppointment extends StatefulWidget {
  CalendarAppointment({Key? key}) : super(key: key);

  @override
  State<CalendarAppointment> createState() => _CalendarAppointmentState();
}

_AppointmentDataSource _getCalendarDataSource() {
  List<Appointment> appointments = <Appointment>[];
  appointments.add(Appointment(
    startTime: DateTime.now(),
    endTime: DateTime.now().add(Duration(minutes: 10)),
    subject: 'Meeting',
    color: Colors.blue,
    startTimeZone: '',
    endTimeZone: '',
  ));

  return _AppointmentDataSource(appointments);
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}

class _CalendarAppointmentState extends State<CalendarAppointment> {
  CalendarController _controller = CalendarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SfCalendar(
            view: CalendarView.day,
            dataSource: _getCalendarDataSource(),
            appointmentBuilder:
                (BuildContext context, CalendarAppointmentDetails details) {
              final Appointment meeting = details.appointments.first;
              if (_controller.view != CalendarView.month &&
                  _controller.view != CalendarView.schedule) {
                return Container(
                  child: Column(),
                );
              }
              return Container(
                child: Text(meeting.subject),
              );
            },
          ),
        ),
      ),
    );
  }
}
