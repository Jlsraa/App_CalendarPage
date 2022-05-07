import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_01/utilities/components/custom_appbar.dart';
import 'package:proyecto_01/utilities/components/patient_card.dart';

import 'bloc/patients_bloc.dart';
import '../../utilities/patient.dart';

class PatientsPage extends StatefulWidget {
  const PatientsPage({Key? key}) : super(key: key);

  @override
  State<PatientsPage> createState() => _PatientsPageState();
}

class _PatientsPageState extends State<PatientsPage> {
  getPatients() {
    BlocProvider.of<PatientsBloc>(context).add(GetAllPatientsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getCustomAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: BlocConsumer<PatientsBloc, PatientsState>(
          listener: (context, state) {},
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.props.length,
              itemBuilder: (BuildContext context, int index) {
                return getPatientAsCard(state.props[index]);
                // return getPatientAsCard(patients[index]);
              },
            );
          },
        ),
      ),
    );
  }

  PatientCard getPatientAsCard(dynamic patFormat) {
    Patient patient = Patient(
      email: patFormat.email,
      phoneNumber: patFormat.phoneNumber,
      lastVisit: patFormat.lastVisit,
      name: patFormat.name,
      id: patFormat.id,
      age: patFormat.age,
      notes: patFormat.notes,
      profilePhoto: 'https://source.unsplash.com/random',
      gender: patFormat.gender,
    );
    return PatientCard(patient: patient);
  }
}
