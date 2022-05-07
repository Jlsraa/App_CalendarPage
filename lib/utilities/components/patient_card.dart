import 'package:flutter/material.dart';

import '../../content/patients/patient_info.dart';
import '../patient.dart';

class PatientCard extends StatelessWidget {
  final Patient patient;

  PatientCard({required this.patient});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PatientDetail(
                    patient: this.patient,
                  )),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  this.patient.name,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              ListTile(
                title: Text(this.patient.email),
                leading: Icon(
                  Icons.email,
                  color: Color.fromRGBO(106, 99, 242, 1),
                ),
              ),
              ListTile(
                title: Text(this.patient.phoneNumber),
                leading: Icon(
                  Icons.phone,
                  color: Color.fromRGBO(106, 99, 242, 1),
                ),
              ),
              ListTile(
                title: Text("Last visit: ${this.patient.getDateFormat()}"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
