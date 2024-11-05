import 'package:barbearia/models/cliente.dart';
import 'package:barbearia/models/servico.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Cliente criado com sucesso a partir do JSON', () {
    final clienteJson = {
      'id': 1,
      'nome': 'Carlos',
      'servicos': [
        {'id': 1, 'nome': 'Corte de Cabelo', 'descricao': 'Corte simples'},
      ],
    };

    final cliente = Cliente.fromJson(clienteJson);

    expect(cliente.id, 1);
    expect(cliente.nome, 'Carlos');
    expect(cliente.servicos.first.nome, 'Corte de Cabelo');
  });

  test('Converte Cliente para JSON corretamente', () {
    final cliente = Cliente(
      1,
      'Carlos',
      [Servico(id: 1, nome: 'Corte de Cabelo', descricao: 'Corte simples')],
    );

    final clienteJson = cliente.toJson();

    expect(clienteJson['id'], 1);
    expect(clienteJson['nome'], 'Carlos');
    expect(clienteJson['servicos'][0]['nome'], 'Corte de Cabelo');
  });
}
