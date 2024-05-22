import 'package:flutter/material.dart';


class NavIconTheme {
  static final ThemeData theme = ThemeData(
    primarySwatch: Colors.teal,
    iconTheme: const IconThemeData(size: 30),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
    ),
  );
}