
class Servico{

 int _id;
 String nome;
 double preco;

Servico(this._id, this.nome, this.preco);

int get id => _id;

set id(int value) => _id = value;


//SERVICO EM JSON
Servico.fromJson(Map<String, dynamic> json)
: _id = json['id'],
nome = json['nome'],
preco = json ['preco'];



//JSON EM SERVICO
Map<String, dynamic> toJson()=>{
  'id' : _id,
  'nome' : nome,
  'preco' : preco,
};
 
 @override
  String toString(){
  return 'Servico:{id: $_id,nome: $nome, preco: $preco}';
  }
}