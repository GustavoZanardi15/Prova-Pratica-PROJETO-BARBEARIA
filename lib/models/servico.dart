class Servico {
  int id;
  String nome;
  String descricao;

  Servico({required this.id, required this.nome, required this.descricao});

  factory Servico.fromJson(Map<String, dynamic> json) {
    return Servico(
      id: json['id'],
      nome: json['nome'],
      descricao: json['descricao'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'descricao': descricao,
    };
  }
}
