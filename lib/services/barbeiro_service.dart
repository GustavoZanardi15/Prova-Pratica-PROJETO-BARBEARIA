import 'package:barbearia/models/barbeiro.dart';
import 'package:barbearia/models/servico.dart';

class BarbeiroService {
  final List<Barbeiro> _barbeiros = [];

  void adicionarBarbeiro(Barbeiro barbeiro) {
    _barbeiros.add(barbeiro);
  }

  void updateBarbeiro(int id, Barbeiro updateBarbeiro) {
    final index = _barbeiros.indexWhere((barbeiro) => barbeiro.id == id);
    if (index != -1) {
      _barbeiros[index] = updateBarbeiro;
    }
  }

  void deleteBarbeiro(int id) {
    _barbeiros.removeWhere((barbeiro) => barbeiro.id == id);
  }

  List<Barbeiro> getBarbeiros() {
    return _barbeiros;
  }

  Barbeiro? getBarbeiroById(int id) {
    return _barbeiros.firstWhere(
      (barbeiro) => barbeiro.id == id,
      orElse: () => throw Exception("Barbeiro não encontrado")
    );
  }

  void adicionarServicoParaBarbeiro(int barbeiroId, Servico servico) {
    final barbeiro = getBarbeiroById(barbeiroId);
    if (barbeiro != null) {
      barbeiro.servicos.add(servico); // Adiciona o serviço à lista
      updateBarbeiro(barbeiroId, barbeiro); // Atualiza o barbeiro com a lista modificada
    }
  }

  List<Servico> getServicosDoBarbeiro(int barbeiroId) {
    final barbeiro = getBarbeiroById(barbeiroId);
    return barbeiro?.servicos ?? []; // Retorna a lista de serviços ou uma lista vazia
  }
}
