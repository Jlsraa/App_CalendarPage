import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_01/content/patients/bloc/patients_bloc.dart';

import '../../utilities/components/custom_input.dart';
import '../../utilities/components/simple_appbar.dart';

class CreatePatient extends StatefulWidget {
  CreatePatient({Key? key}) : super(key: key);

  @override
  State<CreatePatient> createState() => _CreatePatientState();
}

class _CreatePatientState extends State<CreatePatient> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getSimpleAppBar(context),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(
                "Add Patient",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 16.0),
              CustomInput(label: "Name", controller: nameController),
              SizedBox(height: 16.0),
              CustomInput(label: "Age", controller: ageController),
              SizedBox(height: 16.0),
              CustomInput(label: "Gender", controller: genderController),
              SizedBox(height: 16.0),
              CustomInput(label: "Notes", controller: notesController),
              SizedBox(height: 16.0),
              CustomInput(
                  label: "Phone Number", controller: phoneNumberController),
              SizedBox(height: 16.0),
              CustomInput(label: "Email", controller: emailController),
              SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                            elevation: MaterialStateProperty.all(0.0),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 18,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Map<String, dynamic> newPatient = {
                              "name": nameController.text,
                              "age": ageController.text,
                              "gender": genderController.text,
                              "notes": notesController.text,
                              "phoneNumber": phoneNumberController.text,
                              "email": emailController.text,
                              "lastVisited": DateTime.now(),
                            };
                            print(newPatient);
                            BlocProvider.of<PatientsBloc>(context).add(
                              AddPatientEvent(newPatient: newPatient),
                            );
                            nameController.clear();
                            ageController.clear();
                            genderController.clear();
                            notesController.clear();
                            phoneNumberController.clear();
                            emailController.clear();
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Save Changes",
                            style: TextStyle(fontSize: 18),
                          ),
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.symmetric(
                                  horizontal: 32.0, vertical: 16.0),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(200),
                              ),
                            ),
                            elevation: MaterialStateProperty.all(0.0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
