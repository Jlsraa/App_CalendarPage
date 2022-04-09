import 'package:flutter/material.dart';

dynamic getSimpleAppBar(BuildContext context) {
  return AppBar(
    toolbarHeight: 100,
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    leading: IconButton(
      icon: Icon(Icons.arrow_back, size: 32.0),
      color: Colors.black,
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  );
}
