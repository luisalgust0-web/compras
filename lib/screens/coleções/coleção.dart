import 'package:compras/screens/auth/login.dart';
import 'package:compras/services/ColecoesService.dart';
import 'package:compras/services/AuthService.dart';
import 'package:flutter/material.dart';

class Colecao extends StatefulWidget {
  @override
  _ColecaoState createState() => _ColecaoState();
}

var colecao = ColecaoService(AuthService.instanceUser.key);
TextEditingController nome = TextEditingController();

class _ColecaoState extends State<Colecao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        backgroundColor: Colors.brown[600],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          colecao.addItem();
        },
      ),
      body: Container(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                controller: nome,
                decoration: InputDecoration(
                  hintText: 'nome',
                ),
              ),
              FlatButton(
                  onPressed: () {
                    AuthService().logout();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Text('logout'))
            ],
          ),
        ),
      ),
    );
  }
}
