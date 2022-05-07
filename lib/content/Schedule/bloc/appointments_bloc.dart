import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'appointments_event.dart';
part 'appointments_state.dart';

class AppointmentsBloc extends Bloc<AppointmentsEvent, AppointmentsState> {
  AppointmentsBloc() : super(AppointmentsInitial()) {
    on<NewAppointmentEvent>(addAppointment);
  }

  FutureOr<void> addAppointment(event, emit) async {
    emit(LoadingNewAppointmentState());
    var docRef = await FirebaseFirestore.instance
        .collection('userSchedule')
        .add(event.appointmentData);
    await updateUserDocumentReference(docRef.id);
    emit(SuccessNewAppointmentState());
  }

  Future updateUserDocumentReference(String id) async {
    try {
      var queryUser = await FirebaseFirestore.instance
          .collection('users')
          .doc("${FirebaseAuth.instance.currentUser!.uid}");
      var docsRef = await queryUser.get();
      List<dynamic> listIds = docsRef.data()?["patients"] ?? [];

      listIds.add(id);
      await queryUser.update({"patients": listIds});
    } catch (e) {
      print("Error al actualizar users collection${e}");
      return false;
    }
  }
}
