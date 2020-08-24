import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        backgroundColor: Colors.brown[600],
        title: Text(
          "Login",
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  icon: Icon(Icons.people), hintText: "Usuário",),
                  keyboardType: TextInputType.text,
            ),
            Container(height: 10,),
            TextField(
              decoration: InputDecoration(icon: Icon(Icons.lock),
                hintText: "Senha",),
                  keyboardType: TextInputType.visiblePassword,
            ),
            Container(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(onPressed: null, child: Text("Login"),),
                Container(width: 20,),
                FlatButton(onPressed: null, child: Text("Limpar"),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
