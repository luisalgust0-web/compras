import 'package:compras/services/AuthService.dart';
import 'package:flutter/material.dart';

class ScaffoldApp extends StatefulWidget {
  final Widget body;

  @override
  _ScaffoldAppState createState() => _ScaffoldAppState();

  ScaffoldApp({this.body});
}

class _ScaffoldAppState extends State<ScaffoldApp> {

  _ScaffoldAppState();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        backgroundColor: Colors.brown[600],
        title: Text(
          "Login",
        ),actions: [
            FlatButton.icon(onPressed: (){AuthService().logout();}, icon: Icon(Icons.person), label: Text("Logout"))
          ],
      ),body: this.widget.body,);
  }
}