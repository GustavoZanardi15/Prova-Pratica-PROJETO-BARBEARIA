class Barbeiro{

 int _id;
 String nome;


 Barbeiro(this._id, this.nome );

 int get id => _id;

 set id(int value)=> _id = value;

//JSON EM CLIENTE
  Barbeiro.fromjson(Map<String, dynamic> json)
  : _id = json['id'],
  nome = json['nome'];

//CLIENTE EM JSON
Map<String, dynamic> toJson ()=>{
  'id': _id,
  'nome' : nome,
};

  @override
String toString() {
  return 'Barbeiro: {id: $_id, nome: $nome}';
}


  }
