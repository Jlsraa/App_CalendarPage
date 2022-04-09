import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_01/utilities/constants.dart';

import '../../utilities/components/custom_appbar.dart';

class ScheduleAppointmentPage extends StatefulWidget {
  ScheduleAppointmentPage({Key? key}) : super(key: key);

  @override
  State<ScheduleAppointmentPage> createState() =>
      _ScheduleAppointmentPageState();
}

class _ScheduleAppointmentPageState extends State<ScheduleAppointmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 0, 40, 40),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Agendar Cita",
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
              height: 10.0,
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
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
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
                fixedSize: MaterialStateProperty.all(Size(262, 61)),
                elevation: MaterialStateProperty.all(0.0),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    side: BorderSide(
                      color: Color.fromRGBO(106, 99, 242, 1),
                    ),
                  ),
                ),
              ),
              child: Text(
                "Agendar",
                style: TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
