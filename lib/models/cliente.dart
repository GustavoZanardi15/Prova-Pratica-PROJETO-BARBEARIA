import 'servico.dart';

class Cliente {

  int _id;
  String nome;
  List<Servico> servicos;

  Cliente (this._id, this.nome, this.servicos);

int get id => _id;

set id(int value) => _id =value;

//JSON EM CLIENTE
Cliente.fromjson(Map<String , dynamic> json)
: _id = json['id'],
 nome = json['nome'],
    servicos =(json['servicos'] as List)
    .map((servicoJson) => Servico.fromJson(servicoJson))
    .toList();

//CLIENTE EM JSON
  Map<String, dynamic> toJson() => {
        'id': _id,
        'nome': nome,
        'servicos': servicos.map((servico) => servico.toJson()).toList(),
     };

@override
String toString() {
  return 'Cliente: {id: $_id, nome: $nome, servicos: ${servicos.map((servico) => servico.toString()).toList()}}';
}

}