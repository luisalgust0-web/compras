class Item {
  Item({this.uid, this.nome, this.done});

  String uid;
  String nome;
  bool done;

  Item.fromJson(Map<String, dynamic> json1) {
    uid = json1['uid'];
    nome = json1['nome'];
    done = json1['done'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> retorno = new Map<String, dynamic>();
    retorno['uid'] = this.uid;
    retorno['nome'] = this.nome;
    retorno['done'] = this.done;
    return retorno;
  }
}
