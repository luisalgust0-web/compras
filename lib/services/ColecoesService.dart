import 'package:compras/models/userApp.dart';
import 'package:compras/models/Item.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:compras/screens/coleções/coleção.dart';

class ColecaoService {
  final String userID;
  ColecaoService(this.userID);

  FirebaseDatabase database = FirebaseDatabase();
  DatabaseReference colecao;

  void addItem() {
    colecao = database.reference().child('lista');
    colecao
        .push()
        .set(Item(uid: userID, nome: nome.text, done: false).toJson());
  }
}
