import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:proyecto_01/utilities/patient.dart';

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
      // Query to get patients from current user ****
      var queryUser = await FirebaseFirestore.instance
          .collection("userDoctor")
          .doc("${FirebaseAuth.instance.currentUser!.uid}");
      // get data from document
      var docsRef = await queryUser.get();
      List<dynamic> patientsIds = docsRef.data()?["patients"] ?? [];
      // ********************************************************

      // Get all patients ***
      var queryPatients =
          await FirebaseFirestore.instance.collection("patients").get();
      // ********************************************************

      // Filter patients -> They must be included in doctor's patients list
      List<Map<String, dynamic>> patientsFiltered = queryPatients.docs
          .where((doc) => patientsIds.contains(doc.id))
          .map((doc) => doc.data().cast<String, dynamic>())
          .toList();
      // Save a list of IDS just to be able to create a patient instance
      List<dynamic> patientsFilteredIDs = queryPatients.docs
          .where((doc) => patientsIds.contains(doc.id))
          .toList();
      // ********************************************************

      // Save the doctor's patients into a list and sent it back
      final List<Patient> patients = [];

      for (var i = 0; i < patientsFilteredIDs.length; i++) {
        final Timestamp timestamp =
            patientsFiltered[i]['lastVisited'] ?? Timestamp.now();

        final DateTime date = timestamp.toDate();

        Patient patient = Patient(
            email: patientsFiltered[i]["email"],
            phone: patientsFiltered[i]["phoneNumber"],
            lastVisit: date,
            name: patientsFiltered[i]["name"],
            id: "${patientsFilteredIDs[i]}");
        patients.add(patient);
      }
      emit(PatientsSuccessState(patients: patients));
      // ********************************************************
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
    } catch (e) {
      print("Error while adding patient -> ${e}");
      emit(PatientsErrorState());
    }
  }
}
