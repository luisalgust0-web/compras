import 'package:compras/models/userApp.dart';
import 'package:compras/screens/wrapper.dart';
import 'package:compras/services/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main ()=> runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserApp>.value(
        value: AuthService().user,
        child: MaterialApp(
        title: "Compras",
        home: Wrapper(),
      ),
    );
  }
}