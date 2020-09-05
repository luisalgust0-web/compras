import 'package:compras/models/userApp.dart';
import 'package:compras/screens/auth/login.dart';
import 'package:compras/screens/cole%C3%A7%C3%B5es/cole%C3%A7%C3%A3o.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth/auth.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserApp>(context);

      if(user == null){
        return Auth();
      }

    return Colecao();
  }
}
