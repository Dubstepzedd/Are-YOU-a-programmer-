import 'package:flutter/material.dart';
import "package:quiz_programmer/views/home/home_view.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Are you a programmer?',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily: "Open Sans",
          
        )
      ),
      home: const HomeView(),
    );
  }
}
