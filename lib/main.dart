import 'package:flutter/material.dart';
import 'package:pet_store/pages/home_page.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.brown),
    home: const Scaffold(
      body: HomePage(),
    ),
  ));
}
