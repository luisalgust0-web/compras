import 'package:firebase_database/firebase_database.dart';
import 'package:compras/screens/coleções/coleção.dart';

class ColecaoService {
  FirebaseDatabase database = FirebaseDatabase();
  DatabaseReference colecao;

  void addItem() {
    colecao = database.reference().child('items').child('id');
    colecao.push().set(nome.text);
  }
}
