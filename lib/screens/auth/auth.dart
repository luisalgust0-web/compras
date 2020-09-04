
import 'package:compras/screens/auth/login.dart';
import 'package:compras/screens/auth/newUser.dart';
import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
    @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  
  bool newUser = false;

  void toggleNewUser(){
    setState(() {
      this.newUser = !this.newUser;
    });
    
  }
  
  @override
  Widget build(BuildContext context) {
    
    if(this.newUser) return NewUser(toggleNewUser: this.toggleNewUser,);

    return Login(toggleNewUser: this.toggleNewUser);
  }
}