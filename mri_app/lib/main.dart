import 'package:flutter/material.dart';
import 'screens/note_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notion Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
        ,
        textTheme: TextTheme(
          headlineLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontSize: 18.0),
        ),
      ),
      home: NoteListScreen(),
    );
  }
}