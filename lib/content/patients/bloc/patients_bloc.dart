import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../utilities/patient.dart';

part 'patients_event.dart';
part 'patients_state.dart';

class PatientsBloc extends Bloc<PatientsEvent, PatientsState> {
  PatientsBloc() : super(PatientsInitial()) {
    on<PatientsEvent>(getAllPatients);
  }

  FutureOr<void> getAllPatients(event, emit) async {
    emit(PatientsLoadingState());
    try {
      // Query to get patients from current user
      var queryUser = await FirebaseFirestore.instance
          .collection("userDoctor")
          .doc("${FirebaseAuth.instance.currentUser!.uid}");
      // get data from document
      var docsRef = await queryUser.get();
      List<Patient> patients = docsRef.data()?["patients"] ?? [];

      emit(PatientsSuccessState(patients: patients));
    } catch (e) {
      print("Error while getting patients -> ${e}");
      emit(PatientsErrorState());
    }
  }
}
