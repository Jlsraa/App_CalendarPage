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
    on<AddPatientEvent>(addPatient);
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
      var patients = docsRef.data()?["patients"] ?? [];

      emit(PatientsSuccessState(patients: patients));
    } catch (e) {
      print("Error while getting patients -> ${e}");
      emit(PatientsErrorState());
    }
  }

  FutureOr<void> addPatient(event, emit) async {
    emit(PatientsLoadingState());
    try {
      // Query to get patients from current doctor
      var queryUser = await FirebaseFirestore.instance
          .collection("userDoctor")
          .doc("${FirebaseAuth.instance.currentUser!.uid}");

      var docsFromCurrentDoctor = await queryUser.get();
      List<dynamic> patientsIDs =
          docsFromCurrentDoctor.data()?["patients"] ?? [];

      // all patients documents
      // var queryPatients =
      //     await FirebaseFirestore.instance.collection("patients").get();

      // add the new patient to patients document
      DocumentReference<Map<String, dynamic>> lastDocument =
          await FirebaseFirestore.instance
              .collection("patients")
              .add(event.props[0]);
      // we save the id, so that we can save it into the array of doctor's patients.
      String lastId = lastDocument.id;

      // We push the id to patients array
      patientsIDs.add(lastId);

      // We update the array in Firebase
      await queryUser.update({"patients": patientsIDs});

      emit(AddedPatientState());
      print("Added patient");
    } catch (e) {
      print("Error while adding patient -> ${e}");
      emit(PatientsErrorState());
    }
  }
}
