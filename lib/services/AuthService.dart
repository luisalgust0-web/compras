import 'package:compras/models/userApp.dart';
import 'package:compras/screens/auth/newUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class AuthService {


  //FirebaseAuth
  FirebaseAuth auth = FirebaseAuth.instance;
  
  
  Stream<UserApp> get user{
    return this.auth.onAuthStateChanged.map(translateFromFirebase);
  }

  UserApp translateFromFirebase(FirebaseUser fireUser){
    if(fireUser == null) return null;

    return UserApp(fireUser.uid,"Teste", fireUser.email);
  }

  //creatUser
  void creatUser(String email, String password) async {
    final userLocal = (await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ));
  }

  //getUser

  //Login
  void login(String email, String password) async {
    final userLocal = (await auth.signInWithEmailAndPassword(
        email: email, password: password));
    var t = userLocal.user;
    //AuthService.user = User('1','Nome do usuário','usuario@gmail.com');
  }

  //logout
  void logout() {
    auth.signOut();
  }
}
