import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_01/content/Schedule/bloc/appointments_bloc.dart';
import 'package:proyecto_01/content/patients/create_patient.dart';

import '../../utilities/components/custom_appbar.dart';

import '../../utilities/patient.dart';
import '../patients/bloc/patients_bloc.dart';

class ScheduleAppointmentPage extends StatefulWidget {
  ScheduleAppointmentPage({Key? key}) : super(key: key);

  @override
  State<ScheduleAppointmentPage> createState() =>
      _ScheduleAppointmentPageState();
}

class _ScheduleAppointmentPageState extends State<ScheduleAppointmentPage> {
  var datetime;

  TextEditingController dateController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  int selectedIndex = 0;

  Color selectedColor = Color.fromARGB(255, 106, 99, 242);
  Color notSelectedColor = Color.fromARGB(200, 169, 165, 255);

  getPatients() {
    BlocProvider.of<PatientsBloc>(context).add(GetAllPatientsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getCustomAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 40),
          child: BlocConsumer<PatientsBloc, PatientsState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is PatientsSuccessState) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Schedule appointment",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Select patient",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreatePatient()),
                            );
                          },
                          child: Text(
                            "Add patient",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    SizedBox(
                      height: 130.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.props.length,
                        itemBuilder: (BuildContext context, int index) {
                          Patient patient = state.props[index] as Patient;
                          print(state.props[index]);
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                this.selectedIndex = index;
                              });
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: index == selectedIndex
                                  ? selectedColor
                                  : notSelectedColor,
                              elevation: 3.0,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      patient.name,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "Last visit:",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      patient.getDateFormat(),
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Text(
                          "Please select date and time",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    // Expanded(
                    //   child: CupertinoDatePicker(
                    //     onDateTimeChanged: (val) {},
                    //   ),
                    // ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DateTimePicker(
                          controller: dateController,
                          showCursor: false,
                          type: DateTimePickerType.dateTimeSeparate,
                          dateMask: 'd MMM, yyyy',
                          // initialValue: DateTime.now().toString(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2050),
                          icon: const Icon(Icons.event),
                          dateLabelText: 'Date',
                          timeLabelText: "Hour",
                          onChanged: (value) {
                            datetime = value;
                          },
                          onSaved: (value) {
                            datetime = value;
                          }),
                    ),
                    Row(
                      children: [
                        Text(
                          "Notes",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    TextField(
                      controller: notesController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        hintText: "Add notes...",
                        filled: true,
                        fillColor: Color.fromARGB(255, 225, 234, 249),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30.0),
                          ),
                        ),
                      ),
                      maxLines: 30,
                      minLines: 5,
                    ),
                    SizedBox(height: 25),
                    ElevatedButton(
                      onPressed: () {
                        Patient selectedPatient =
                            state.props[selectedIndex] as Patient;
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text(
                              'Appointment',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color.fromRGBO(106, 99, 242, 1),
                              ),
                            ),
                            content: Text(
                                "Schedule appoinment for ${selectedPatient.name} at ${dateController.value.text}?"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context, 'CANCEL');
                                },
                                child: Text(
                                  'CANCEL',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey[700]),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  BlocProvider.of<AppointmentsBloc>(context)
                                      .add(
                                    NewAppointmentEvent(appointmentData: {
                                      "patient": "${selectedPatient.id}",
                                      "notes": "${notesController.value.text}",
                                      "date": "${dateController.value.text}",
                                    }),
                                  );
                                  Navigator.pop(context, 'OK');
                                  dateController.clear();
                                  notesController.clear();
                                },
                                child: Text(
                                  'OK',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromRGBO(106, 99, 242, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(330, 61)),
                        elevation: MaterialStateProperty.all(0.0),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            side: BorderSide(
                              color: Color.fromRGBO(106, 99, 242, 1),
                            ),
                          ),
                        ),
                      ),
                      child: Text(
                        "Schedule",
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                );
              } else {
                return Center(
                  child: Column(
                    children: [
                      Text(
                          "Add more patients before trying to schedule an appointment"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreatePatient()),
                          );
                        },
                        child: Text(
                          "Add patient",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
