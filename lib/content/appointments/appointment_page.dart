import 'package:flutter/material.dart';
import 'package:proyecto_01/utilities/components/custom_appbar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AppointmentPage extends StatefulWidget {
  AppointmentPage({Key? key}) : super(key: key);

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar,
      body: SfCalendar(
        firstDayOfWeek: 1,
        view: CalendarView.month,
        showDatePickerButton: true,
        showNavigationArrow: true,
        selectionDecoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: Color.fromRGBO(106, 99, 242, 1),
          ),
          borderRadius: BorderRadius.all(Radius.circular(4)),
          shape: BoxShape.rectangle,
        ),
        monthViewSettings: MonthViewSettings(
          showAgenda: true,
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
          agendaStyle: AgendaStyle(backgroundColor: Colors.grey[200]),
          dayFormat: 'EEE',
        ),
      ),
    );
  }
}
