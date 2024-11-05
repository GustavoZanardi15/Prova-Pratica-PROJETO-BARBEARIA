import 'package:barbearia/models/servico.dart';
import 'package:barbearia/services/servico_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'servico_service_test.mocks.dart';

@GenerateMocks([ServicoService])
void main() {
  final mockServicoService = MockServicoService();

  test('Filtra serviços retornados pela requisição HTTP', () async {
    // Dados mock
    final servicos = [
      Servico(id: 1, nome: 'Corte de Cabelo', descricao: 'Corte simples'),
      Servico(id: 2, nome: 'Barba', descricao: 'Aparar a barba'),
    ];

    when(mockServicoService.getServicos()).thenAnswer((_) async => servicos);

    final result = await mockServicoService.getServicos();
    final filtro = result.where((servico) => servico.nome.contains('Corte')).toList();

    expect(filtro.length, 1);
    expect(filtro.first.nome, 'Corte de Cabelo');
  });
}
