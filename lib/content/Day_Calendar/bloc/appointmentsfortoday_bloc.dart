import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
      // Query to get meetings from current user
      var queryUser = await FirebaseFirestore.instance
          .collection("userDoctor")
          .doc("${FirebaseAuth.instance.currentUser!.uid}");
      // get data from document
      var docsRef = await queryUser.get();
      List<dynamic> listIds = docsRef.data()?["patients"] ?? [];

      // query to get documents from userSchedule
      var queryPictures =
          await FirebaseFirestore.instance.collection("userSchedule").get();

      // filter everything (that it belongs to current user
      List<Map<String, dynamic>> meetingsList = queryPictures.docs
          .where((doc) => listIds.contains(doc.id))
          .map((doc) => doc.data().cast<String, dynamic>())
          .toList();
      List<Meeting> meetingsForToday = [];

      emit(SuccessAppointmentsState(meetings: meetingsForToday));
    } catch (e) {
      print("Error while getting disabled items: ${e}");
      emit(ErrorAppointmentsState());
    }
  }
}
