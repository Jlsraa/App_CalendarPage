import 'package:flutter/material.dart';
import 'package:proyecto_01/utilities/components/custom_appbar.dart';
import 'package:proyecto_01/utilities/components/patient_card.dart';
import 'package:proyecto_01/utilities/data/patients_data.dart';

import '../utilities/patient.dart';

class PatientsPage extends StatefulWidget {
  const PatientsPage({Key? key}) : super(key: key);

  @override
  State<PatientsPage> createState() => _PatientsPageState();
}

class _PatientsPageState extends State<PatientsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getCustomAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: ListView.builder(
          itemCount: patients.length,
          itemBuilder: (BuildContext context, int index) {
            return getPatientAsCard(patients[index]);
          },
        ),
      ),
    );
  }

  PatientCard getPatientAsCard(Patient patient) {
    return PatientCard(
        name: patient.name,
        phone: patient.phone,
        email: patient.email,
        lastVisit:
            "${patient.lastVisit!.day}/${patient.lastVisit!.month}/${patient.lastVisit!.year}");
  }
}
