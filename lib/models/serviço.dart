class Servico{

 int _id;
 String nome;
 double preco;

Servico(this._id, this.nome, this.preco);


Servico.fromJson(Map<String, dynamic> json)
: _id = json['id'],
nome = json['nome'],
preco = json ['preco'];


Map<String, dynamic> toJson()=>{
  'id' : _id,
  'nome' : nome,
  'preco' : preco,
};
 
}