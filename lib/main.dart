import 'package:compras/screens/wrapper.dart';
import 'package:flutter/material.dart';

void main ()=> runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Compras",
      home: Wrapper(),
    );
  }
}