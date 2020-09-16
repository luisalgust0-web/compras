import 'package:compras/models/userApp.dart';
import 'package:compras/screens/auth/newUser.dart';
import 'package:compras/screens/cole%C3%A7%C3%B5es/cole%C3%A7%C3%A3o.dart';
import 'package:compras/services/AuthService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  final Function toggleNewUser;

  Login({this.toggleNewUser});

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
        actions: [
          FlatButton.icon(
              onPressed: () {
                this.widget.toggleNewUser();
              },
              icon: Icon(Icons.people),
              label: Text("Novo Usuário"))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/carrinho.jpg"),
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.1), BlendMode.dstATop),
            ),
          ),
          child: Form(
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
                        color: Colors.brown.withOpacity(0.2),
                        onPressed: () {
                          login(this.controllerUser.text,
                              this.controllerPassword.text, context);
                        },
                        child: Text("Login"),
                      ),
                      Container(
                        width: 20,
                      ),
                      FlatButton(
                        color: Colors.brown.withOpacity(0.2),
                        onPressed: () {},
                        child: Text("Limpar"),
                      ),
                    ],
                  ),
                  Container(
                    height: 50,
                  )
                ],
              ),
            ),
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
    if (this._formKey.currentState.validate()) {
      this.auth.login(email, password);
    }
    // ? this.auth.login(email, password)
    // : Scaffold.of(contexto).showSnackBar(
    //     SnackBar(
    //       content: Text("Erro na validação"),
    //     ),
    //   );
  }
}
