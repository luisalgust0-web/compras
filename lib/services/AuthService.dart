import 'package:compras/models/userApp.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static UserApp user;

  //FirebaseAuth
  FirebaseAuth auth = FirebaseAuth.instance;

  //creatUser
  void creatUser(String email, String password) async {
    final userLocal = (await auth.createUserWithEmailAndPassword(
        email: email, password: password));
    var f = userLocal.user;
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
