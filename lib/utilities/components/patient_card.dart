import 'package:flutter/material.dart';

class PatientCard extends StatelessWidget {
  final String name;
  final String phone;
  final String email;
  final String lastVisit;

  PatientCard({
    required this.name,
    required this.phone,
    required this.email,
    required this.lastVisit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
                name,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            ListTile(
              title: Text(email),
              leading: Icon(
                Icons.email,
                color: Color.fromRGBO(106, 99, 242, 1),
              ),
            ),
            ListTile(
              title: Text(phone),
              leading: Icon(
                Icons.phone,
                color: Color.fromRGBO(106, 99, 242, 1),
              ),
            ),
            ListTile(
              title: Text("Last visit: ${lastVisit}"),
            )
          ],
        ),
      ),
    );
  }
}
