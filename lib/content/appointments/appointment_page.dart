import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_01/content/Day_Calendar/bloc/appointmentsfortoday_bloc.dart';
import 'package:proyecto_01/utilities/components/custom_appbar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../utilities/meeting_data_source.dart';

class AppointmentPage extends StatefulWidget {
  AppointmentPage({Key? key}) : super(key: key);

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getCustomAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child:
            BlocConsumer<AppointmentsfortodayBloc, AppointmentsfortodayState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is SuccessAppointmentsState) {
              return SfCalendar(
                dataSource: MeetingDataSource(
                  state.meetings,
                ),
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
                  appointmentDisplayMode:
                      MonthAppointmentDisplayMode.appointment,
                  agendaStyle: AgendaStyle(backgroundColor: Colors.grey[200]),
                  dayFormat: 'EEE',
                ),
              );
            } else if (state is LoadingAppointmentsState) {
              return CircularProgressIndicator();
            } else {
              return Center(
                child: Text("Error :("),
              );
            }
          },
        ),
      ),
    );
  }
}
