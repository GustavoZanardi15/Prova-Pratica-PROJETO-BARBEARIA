class Servico{

 String nome;
 int _id;
 double preco;

Servico(this.nome, this._id, this.preco);


@override
  String toString() {
    return 'Servico: (id: $_id,nome: $nome, preco: $preco)';
  }

}