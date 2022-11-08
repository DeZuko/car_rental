/* #1
By: Muhammad Aiman Danial */
import 'package:flutter/material.dart';
import './homepage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  // Constructor passing key with type key
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create theme object
    final ThemeData theme = ThemeData();
    const appTitle = 'Car Rental App';
    // set theme
    return MaterialApp(
      title: appTitle,
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.brown[900],
          secondary: Colors.black,
        ),
      ),
      home: const HomePage(),
    );
  }
}
