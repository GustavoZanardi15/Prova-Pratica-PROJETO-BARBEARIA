class Cliente {

  String nome;
  int _id;
  String servico;

  Cliente (this.nome, this._id, this.servico);

@override
  String toString() {
    return 'Cliente: (id: $_id, nome: $nome, servico: $servico)';
  }
}