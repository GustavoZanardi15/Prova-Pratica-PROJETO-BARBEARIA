import 'package:barbearia/models/barbeiro.dart';

class BarbeiroService {

final List<Barbeiro> _barbeiros =[];

void adicionarBarbeiro(Barbeiro barbeiro){
     _barbeiros.add(barbeiro);
}
  

void updateBarbeiro(int id, Barbeiro updateBarbeiro){
  final index = _barbeiros.indexWhere((barbeiro)=> barbeiro.id == id);
     if (index != -1){
      _barbeiros[index] = updateBarbeiro;
     }
}

void deleteBarbeiro(int id){
  _barbeiros.removeWhere((barbeiro) => barbeiro.id == id);
}

List<Barbeiro> getBarbeiros(){
  return _barbeiros;
}

Barbeiro? getBarbeiroById(int id) {
  return _barbeiros.firstWhere(
    (barbeiro) => barbeiro.id == id,
    orElse: () => throw Exception("Barbeiro não encontrado"));
}

}