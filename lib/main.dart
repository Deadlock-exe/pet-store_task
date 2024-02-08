import 'package:flutter/material.dart';
import 'package:pet_store/pages/home_page.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.light().copyWith(
      primaryColor: Colors.brown[200],
      primaryColorLight: Colors.brown[100],
    ),
    darkTheme: ThemeData.dark().copyWith(
      primaryColorLight: Colors.brown[800],
      primaryColor: Colors.brown[900],
    ),
    themeMode: ThemeMode.system,
    home: const Scaffold(
      body: HomePage(),
    ),
  ));
}
