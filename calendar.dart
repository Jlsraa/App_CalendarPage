import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          // Bienvenida al usuario con su nombre
          children: [
            Row(
              children: [
                Text(
                  "Bienvenido, John",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                Text("Estas son sus consultas del día de hoy",
                    textAlign: TextAlign.start, style: TextStyle(fontSize: 16)),
              ],
            ),
            // Calendario
            Column(
              children: [
                Row(
                  children: [
                    // Hora
                    Text(
                      "9:00 AM",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    // Carta de info del paciente
                    Container(
                      height: 91,
                      width: 211,
                      child: Card(
                        color: Color.fromRGBO(169, 165, 255, 100),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Text(
                                "Julieta Ramos",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
