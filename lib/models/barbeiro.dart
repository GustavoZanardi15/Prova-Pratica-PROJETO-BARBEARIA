import 'package:barbearia/models/servico.dart';

class Barbeiro {
  int _id;
  String nome;
  List<Servico> servicos; // Certifique-se de que esta propriedade é do tipo List<Servico>

  Barbeiro(this._id, this.nome, [this.servicos = const []]); // Inicializa a lista de serviços

  int get id => _id;
  set id(int value) => _id = value;

  Barbeiro.fromJson(Map<String, dynamic> json)
    : _id = json['id'],
      nome = json['nome'],
      servicos = (json['servicos'] as List)
          .map((servicoJson) => Servico.fromJson(servicoJson))
          .toList();

  Map<String, dynamic> toJson() => {
    'id': _id,
    'nome': nome,
    'servicos': servicos.map((servico) => servico.toJson()).toList(),
  };

  @override
  String toString() {
    return 'Barbeiro: {id: $_id, nome: $nome, servicos: ${servicos.map((servico) => servico.toString()).toList()}}';
  }
}
