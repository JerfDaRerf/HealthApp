import 'package:flutter/material.dart';
import 'views/navigation_wrapper.dart';

// This function is the main entry point for the Flutter app.
void main() {
  runApp(const FitnessApp());
}

class FitnessApp extends StatelessWidget {
  // Constructor
  // Initializes the key for this widget
  // Keys are important for initializing widgets and for keeping widgets unique from each other
  // in case they ever need to be referenced
  const FitnessApp({Key? key}) : super(key: key);

  // This widget is the root of the application]
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Defines the overarching properties of the app
      // Theme/styling of the app
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'TTNormsPro',
        canvasColor: Colors.white,
        
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 34,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
            size: 34,
          ),
        ),

        searchBarTheme: SearchBarThemeData(
          elevation: const MaterialStatePropertyAll<double>(
            2.0,
          ),
          shape: MaterialStatePropertyAll<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          constraints: const BoxConstraints(
            minHeight: 50.0,
            maxHeight: 50.0,
          ),
          backgroundColor: const MaterialStatePropertyAll<Color>(
            Colors.white,
          ),
          surfaceTintColor: const MaterialStatePropertyAll<Color>(
            Colors.white,
          ),
          hintStyle: const MaterialStatePropertyAll<TextStyle>(
            TextStyle(
              color: Colors.grey,
              fontSize: 18.0,
            )
          ),
        ),
      ),
      // Set the content of the app to be the navigation wrapper
      home:  const NavigationWrapper(),
    );
  }
}