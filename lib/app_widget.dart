import 'package:flutter/material.dart';
import 'package:controle_gastos/pages/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Controle De Gastos',
      home: HomePage(),
    );
  }
}