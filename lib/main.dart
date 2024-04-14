import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pet_store/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // ignore: unused_local_variable
  Box petBox = await Hive.openBox('petbox');

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
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
