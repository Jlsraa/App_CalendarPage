import 'package:flutter/material.dart';

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.details,
      this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  String details;
  bool isAllDay;
}
