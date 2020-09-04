import 'package:compras/models/userApp.dart';
import 'package:compras/screens/auth/login.dart';
import 'package:compras/screens/auth/newUser.dart';
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

      return NewUser();
  }
}