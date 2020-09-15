import 'package:compras/services/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewUser extends StatefulWidget {
  final Function toggleNewUser;

  NewUser({this.toggleNewUser});

  @override
  _NewUserState createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
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
              icon: Icon(Icons.person),
              label: Text("Logout"))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/carrinho.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.1), BlendMode.dstATop))),
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
                      if (value == "")
                        return 'senha obrigatoria';
                      else if (value != 6) return 'minimo 6 caracteres';
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
                        color: Colors.brown.withOpacity(0.3),
                        onPressed: () {
                          login(this.controllerUser.text,
                              this.controllerPassword.text, context);
                        },
                        child: Text("Salvar"),
                      ),
                      Container(
                        width: 20,
                      ),
                      FlatButton(
                        color: Colors.brown.withOpacity(0.3),
                        onPressed: () {},
                        child: Text("Limpar"),
                      ),
                    ],
                  ),
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
  }
}
