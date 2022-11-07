// By: Muhammad Aiman Danial
import 'package:flutter/material.dart';
import './homepage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    const appTitle = 'Car Rental App';
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
