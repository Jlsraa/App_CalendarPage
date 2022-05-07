import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:proyecto_01/utilities/components/custom_appbar.dart';
import 'package:proyecto_01/utilities/meeting_data_source.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'bloc/appointmentsfortoday_bloc.dart';

class CalendarPage extends StatefulWidget {
  CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

// List<Meeting> _getDataSource(BuildContext context) {
//   BlocProvider.of<AppointmentsfortodayBloc>(context)
//       .add(GetAppointmentsForTodayEvent());

//   List<Meeting> meetings = [];

//   BlocConsumer<AppointmentsfortodayBloc, AppointmentsfortodayState>(
//     listener: (context, state) {},
//     builder: (context, state) {
//       meetings = state.props as List<Meeting>;
//       MeetingDataSource mds = MeetingDataSource(meetings);
//       return mds as Widget;
//     },
//   );

//   final DateTime today = DateTime.now();
//   final DateTime startTime =
//       DateTime(today.year, today.month, today.day, 15, 0, 0);
//   final DateTime endTime = startTime.add(const Duration(hours: 2));

//   return meetings;
// }

class _CalendarPageState extends State<CalendarPage> {
  @override
  void initState() {
    super.initState();
    setState(() {});
    print(userName);
  }

  String? userName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getCustomAppBar(context),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
        child: Column(
          // Bienvenida al usuario con su nombre
          children: [
            Row(
              children: [
                FutureBuilder(
                  future: _fetch(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done)
                      return CircularProgressIndicator();
                    return Container(
                      width: MediaQuery.of(context).size.width - 100,
                      child: Text(
                        "Welcome, ${userName!.split(" ")[0]}",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),
                    );
                  },
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 10, 30),
                  child: Text(
                    "Here are today's appointments",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ),
              ],
            ),
            // Calendario
            BlocConsumer<AppointmentsfortodayBloc, AppointmentsfortodayState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is SuccessAppointmentsState) {
                  return Expanded(
                    flex: 1,
                    child: SfCalendar(
                      view: CalendarView.day,
                      dataSource: MeetingDataSource(
                        state.meetings,
                      ),
                      timeSlotViewSettings: TimeSlotViewSettings(
                        timeFormat: 'h:mm a',
                        // startHour: 9,
                        // endHour: 20,
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
                              color: const Color.fromRGBO(106, 99, 242, 1),
                              width: 2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          shape: BoxShape.rectangle),
                      appointmentTextStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  );
                } else if (state is LoadingAppointmentsState) {
                  return CircularProgressIndicator();
                } else {
                  return Text("Error");
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Future _fetch() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser;
    if (firebaseUser != null)
      await FirebaseFirestore.instance
          .collection('userDoctor')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {
        userName = ds.data()!['name'];
      }).catchError((e) {
        print(e);
      });
  }
}
