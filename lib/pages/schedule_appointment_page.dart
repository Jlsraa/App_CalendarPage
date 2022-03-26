import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_01/utilities/constants.dart';

class ScheduleAppointmentPage extends StatefulWidget {
  ScheduleAppointmentPage({Key? key}) : super(key: key);

  @override
  State<ScheduleAppointmentPage> createState() =>
      _ScheduleAppointmentPageState();
}

class _ScheduleAppointmentPageState extends State<ScheduleAppointmentPage> {
  String test = "Test";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 32.0,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 0, 40, 40),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  // "Agendar Cita",
                  test,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Seleccione el paciente",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Agregar",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w300,
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
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Color.fromARGB(255, 106, 99, 242),
                      elevation: 3.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Alberto Romano"),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              "Seleccione la fecha y hora",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Expanded(
              child: CupertinoDatePicker(
                onDateTimeChanged: (val) {},
              ),
            ),
            Text(
              "Nota",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Agregar notas",
                filled: true,
                fillColor: Color.fromARGB(255, 225, 234, 249),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                ),
              ),
              maxLines: 30,
              minLines: 5,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(kPrimaryColor),
              ),
              child: Text("Agendar"),
            )
          ],
        ),
      ),
    );
  }
}
