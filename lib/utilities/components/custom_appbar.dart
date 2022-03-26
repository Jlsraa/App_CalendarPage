import 'package:flutter/material.dart';

AppBar customAppBar = AppBar(
  // centerTitle: false,
  leading: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24.0),
    child: IconButton(
      icon: Icon(Icons.clear_all_rounded, size: 32.0),
      color: Colors.black,
      onPressed: () {},
    ),
  ),
  toolbarHeight: 100,
  backgroundColor: Colors.transparent,
  elevation: 0.0,
  title: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Text(
          'John Doe',
          textAlign: TextAlign.end,
          style: TextStyle(
            color: Colors.grey[900],
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      CircleAvatar(
        backgroundImage: NetworkImage('https://source.unsplash.com/random'),
      ),
    ],
  ),
);
