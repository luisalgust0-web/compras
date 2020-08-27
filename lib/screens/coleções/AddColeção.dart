import 'package:flutter/material.dart';

class AddColecao extends StatefulWidget {
  @override
  _AddColecaoState createState() => _AddColecaoState();
}

TextEditingController nome = TextEditingController();

class _AddColecaoState extends State<AddColecao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        backgroundColor: Colors.brown[600],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
