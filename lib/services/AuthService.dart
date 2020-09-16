import 'package:compras/models/userApp.dart';

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //FirebaseAuth
  FirebaseAuth auth = FirebaseAuth.instance;

  static UserApp instanceUser;

  Stream<UserApp> get user {
    return this.auth.onAuthStateChanged.map(translateFromFirebase);
  }

  UserApp translateFromFirebase(FirebaseUser fireUser) {
    if (fireUser == null) {
      instanceUser = null;
      return null;
    }

    instanceUser = UserApp(fireUser.uid, "Teste", fireUser.email);
    return instanceUser;
  }

  //creatUser
  void creatUser(String email, String password) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  //getUser

  //Login
  Future<void> login(String email, String password) async {
    var result =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    if (result.user != null) {
      instanceUser = translateFromFirebase(result.user);
    }

    //AuthService.user = User('1','Nome do usuário','usuario@gmail.com');
  }

  //logout
  void logout() {
    auth.signOut();
  }
}
