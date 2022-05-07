import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../utilities/meeting.dart';

part 'appointmentsfortoday_event.dart';
part 'appointmentsfortoday_state.dart';

class AppointmentsfortodayBloc
    extends Bloc<AppointmentsfortodayEvent, AppointmentsfortodayState> {
  AppointmentsfortodayBloc() : super(AppointmentsfortodayInitial()) {
    on<GetAppointmentsForTodayEvent>(getAppointmentsForToday);
  }
  FutureOr<void> getAppointmentsForToday(event, emit) async {
    emit(LoadingAppointmentsState());
    try {
      // Query to get patients from current user ****
      var queryUser = await FirebaseFirestore.instance
          .collection("userDoctor")
          .doc("${FirebaseAuth.instance.currentUser!.uid}");
      // get data from document -> Get all patients from doctor
      var docsRef = await queryUser.get();
      List<dynamic> doctorPatients = docsRef.data()?["patients"] ?? [];
      // ********************************************************

      // Get all patients ***
      var queryPatients =
          await FirebaseFirestore.instance.collection("patients").get();
      var allPatients = queryPatients.docs;
      // ********************************************************

      // Filter patients -> They must be included in doctor's patients list
      List<Map<String, dynamic>> patientsFiltered = allPatients
          .where((doc) => doctorPatients.contains(doc.id))
          .map((doc) => doc.data().cast<String, dynamic>())
          .toList();
      // Save an array of IDs
      // Save a list of IDS just to be able to create a patient instance
      List<dynamic> patientsFilteredIDs = queryPatients.docs
          .where((doc) => doctorPatients.contains(doc.id))
          .map((doc) => doc.id)
          .toList();
      // ********************************************************

      // Query to get all appointments ****
      var queryAppointments =
          await FirebaseFirestore.instance.collection("userSchedule").get();
      var allAppointments = queryAppointments.docs;
      // ********************************************************

      // filter everything (that it belongs to current user)
      List<Map<String, dynamic>> appointmentsFiltered = allAppointments
          .where((doc) {
            return patientsFilteredIDs.contains(doc.data()["patient"]) &&
                DateTime.parse(doc.data()["date"]).day == DateTime.now().day;
          })
          .map((doc) => doc.data().cast<String, dynamic>())
          .toList();

      List<Meeting> meetingsForToday = [];

      String name = "Sin nombre";
      for (var i = 0; i < appointmentsFiltered.length; i++) {
        if (patientsFilteredIDs.contains(appointmentsFiltered[i]["patient"])) {
          name = patientsFiltered[i]["name"];
        }
        DateTime start = DateTime.parse(appointmentsFiltered[i]["date"]);
        final DateTime end = start.add(const Duration(minutes: 30));
        Meeting meeting = Meeting(
            eventName: name,
            from: start,
            to: end,
            background: Color.fromRGBO(106, 99, 242, 1),
            details: 'Última vez que visitó: lol',
            isAllDay: false);
        meetingsForToday.add(meeting);
      }

      emit(SuccessAppointmentsState(meetings: meetingsForToday));
    } catch (e) {
      print("Error while getting appointments for today: ${e}");
      emit(ErrorAppointmentsState());
    }
  }
}
