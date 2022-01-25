import 'package:flutter/material.dart';
import 'package:text_fields/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        canvasColor: Colors.black,
        primarySwatch: Colors.teal,
        textTheme: const TextTheme(
            headline1: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 45,
              color: Colors.white,
            ),
            headline2: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.black,
            ),
           ),
      ),
      home: const MyHomePage(),
    );
  }
}
