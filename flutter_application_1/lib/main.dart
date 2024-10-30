import 'package:flutter/material.dart';
import 'package:flutter_application_1/book_controller.dart';
import 'package:flutter_application_1/book_model.dart';
import 'package:flutter_application_1/book_view.dart';
import 'package:flutter_application_1/modal_widget.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); 

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),
      home: BookView());
  }
}