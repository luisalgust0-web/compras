import 'package:compras/models/user.dart';

class AuthService{
  
  static User user;

  //FirebaseAuth

  //getUser

  //Login
  void login(String email, String password){
    AuthService.user = User('1','Nome do usuário','usuario@gmail.com');
  }

  //logout
  void logout(){
    AuthService.user = null;
  }
}