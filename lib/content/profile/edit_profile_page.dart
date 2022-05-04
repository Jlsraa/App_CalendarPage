import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_01/utilities/components/simple_appbar.dart';

import '../../utilities/components/custom_input.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getSimpleAppBar(context),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                minRadius: 48.0,
                maxRadius: 72.0,
                backgroundImage: NetworkImage(
                    "${FirebaseAuth.instance.currentUser!.photoURL}"),
              ),
              SizedBox(
                height: 16.0,
              ),
              SizedBox(height: 16.0),
              CustomInput(label: "Name"),
              SizedBox(height: 16.0),
              CustomInput(label: "Specialty"),
              SizedBox(height: 16.0),
              CustomInput(label: "Telephone Number"),
              SizedBox(height: 16.0),
              CustomInput(label: "E-mail"),
              SizedBox(height: 16.0),
              CustomInput(label: "Location"),
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
                          onPressed: () {},
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
