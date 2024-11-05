import 'package:flutter/material.dart';
import 'package:to_do_list/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      home: const ToDoListScreen(),
    );
  }
}

