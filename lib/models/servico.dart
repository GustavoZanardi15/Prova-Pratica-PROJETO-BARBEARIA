class Servico {
  final int id;
  final String nome;
  final String preco; // Armazenar como String

  Servico(this.id, this.nome, this.preco);

  Map<String, dynamic> toJson() => {
    'id': id,
    'nome': nome,
    'preco': preco,
  };

  factory Servico.fromJson(Map<String, dynamic> json) {
    return Servico(
      json['id'],
      json['nome'],
      json['preco'],
    );
  }

  @override
  String toString() {
    return 'Servico: {id: $id, nome: $nome, preco: $preco}';
  }
}
