import 'package:compras/services/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controllerUser = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final auth = AuthService();

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
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == "") return "O email é obrigatório";
                  return null;
                },
                controller: this.controllerUser,
                decoration: InputDecoration(
                  icon: Icon(Icons.people),
                  hintText: "Usuário",
                ),
                keyboardType: TextInputType.text,
              ),
              Container(
                height: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (value == "") return "A senha é obrigatória";
                  return null;
                },
                controller: this.controllerPassword,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: "Senha",
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
              Container(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    onPressed: (){login(this.controllerUser.text, this.controllerPassword.text, context);},
                    child: Text("Login"),
                  ),
                  Container(
                    width: 20,
                  ),
                  FlatButton(
                    onPressed: null,
                    child: Text("Limpar"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  /*
    ToDo - Rever o porque não mostrou o ScnackBar
  */
  void login(email, password, contexto) {
    this._formKey.currentState.validate()
        ? this.auth.login(email, password)
        : Scaffold.of(contexto).showSnackBar(
            SnackBar(
              content: Text("Erro na validação"),
            ),
          );
  }
}