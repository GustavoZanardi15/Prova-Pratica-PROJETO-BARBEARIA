class Barbeiro{

 int _id;
 String nome;


 Barbeiro(this._id, this.nome );
     
@override
  String toString() {
    return 'Barbeiro: (id: $_id, nome: $nome)' ;
  }

 @override
  Barbeiro.fromjson(Map<String, dynamic> json)
  : _id = json['id'],
  nome = json['nome'];
  
  }
