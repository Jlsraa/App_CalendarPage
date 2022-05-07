import 'package:flutter/material.dart';

class Meeting {
  Meeting(
      {required this.eventName,
      required this.from,
      required this.to,
      required this.background,
      required this.details,
      required this.isAllDay});

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  String details;
  bool isAllDay;

  @override
  String toString() {
    return "${this.eventName}: <${this.from}:${this.to}> ${this.details}";
  }
}
