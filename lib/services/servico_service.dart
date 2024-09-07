import 'package:barbearia/models/serviço.dart';

class ServicoService {

  final List<Servico> _servicos = [];

  void adicionarServico(Servico servico){
    _servicos.add(servico);
  }

  void updateServico(int id, Servico servicoUpdate){
    final index  = _servicos.indexWhere((servico)=> servico.id == id);
      if(index != -1){
    _servicos[index] = servicoUpdate;
  }
}

 void deleteServico(int id){
  _servicos.removeWhere((servico)=>servico.id == id);
 }

 List<Servico> getServicos(){
 return _servicos;

 }

 Servico? getServicoById(int id) {
    return _servicos.firstWhere((servico) => servico.id == id, orElse: () => throw Exception("Serviço não encontrado"));
  }

}