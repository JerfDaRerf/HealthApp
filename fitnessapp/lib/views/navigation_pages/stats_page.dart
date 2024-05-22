import 'package:flutter/material.dart';

class StatsPage extends StatelessWidget {
  // Constructor
  // Initializes the key for this widget
  // Keys are important for initializing widgets and for keeping widgets unique from each other
  // in case they ever need to be referenced
  const StatsPage({Key? key}) : super(key: key);

  // This widget is the root of the application
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Body of the app
      body: Center(
        child: const Text("Stats Page"),
      ),
    );
  }
}