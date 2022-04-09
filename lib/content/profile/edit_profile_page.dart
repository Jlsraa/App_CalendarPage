import 'package:flutter/material.dart';
import 'package:proyecto_01/utilities/components/simple_appbar.dart';

import '../../utilities/components/custom_input.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getSimpleAppBar(context),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              minRadius: 48.0,
              maxRadius: 72.0,
              backgroundImage:
                  NetworkImage('https://source.unsplash.com/random'),
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              "Cambiar foto de perfil",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 16.0),
            CustomInput(label: "Nombre"),
            SizedBox(height: 16.0),
            CustomInput(label: "Título"),
            SizedBox(height: 16.0),
            CustomInput(label: "Número telefónico"),
            SizedBox(height: 16.0),
            CustomInput(label: "Correo Electrónico"),
            SizedBox(height: 16.0),
            CustomInput(label: "Ubicación"),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    "Cancelar",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Guardar"),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
