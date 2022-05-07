import 'package:flutter/material.dart';
import 'package:proyecto_01/utilities/patient.dart';

import '../../utilities/components/simple_appbar.dart';

class PatientDetail extends StatefulWidget {
  final Patient patient;

  PatientDetail({required this.patient});

  @override
  State<PatientDetail> createState() => _PatientDetailState();
}

class _PatientDetailState extends State<PatientDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getSimpleAppBar(context),
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage(widget.patient.profilePhoto),
                  radius: 70,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.patient.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    //textAlign: TextAlign.center,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Gender: ${widget.patient.gender}",
                      style: TextStyle(fontSize: 16)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Age: ${widget.patient.age} years old",
                      style: TextStyle(fontSize: 16)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 20),
                child: Row(
                  children: [
                    Text("Last visit: ${widget.patient.getDateFormat()}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Row(
                children: [
                  Text("Recent notes:", style: TextStyle(fontSize: 16)),
                ],
              ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              //   child: Row(
              //     children: [
              //       Text("- Hemograma Completo",
              //           style: TextStyle(fontSize: 16)),
              //     ],
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              //   child: Row(
              //     children: [
              //       Text("- Perfil lipídico", style: TextStyle(fontSize: 16)),
              //     ],
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              //   child: Row(
              //     children: [
              //       Text(
              //         "Descripción:",
              //         textAlign: TextAlign.start,
              //         style:
              //             TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              //       ),
              //     ],
              //   ),
              // ),
              Row(
                verticalDirection: VerticalDirection.down,
                children: [
                  Flexible(
                    child: Text(
                      widget.patient.notes,
                      style: TextStyle(fontSize: 16),
                      maxLines: 10,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
