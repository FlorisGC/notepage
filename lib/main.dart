
import 'package:flutter/material.dart';
import 'package:flutter_notes_app/notepage.dart';


void main() {
  runApp(const MainApp());
}





class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness:Brightness.dark,
        scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
        textTheme: const TextTheme(
        ),
      ),
      home: const NotePage(),
    );
  }
}