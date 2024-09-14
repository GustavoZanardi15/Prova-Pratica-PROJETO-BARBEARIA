import 'package:flutter/material.dart';
import 'package:barbearia/services/barbeiro_service.dart';

class ListagemScreen extends StatelessWidget {
  const ListagemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final barbeiroService = BarbeiroService();
    final barbeiros = barbeiroService.getBarbeiros();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Listagem de Barbeiros'),
      ),
      body: ListView.builder(
        itemCount: barbeiros.length,
        itemBuilder: (context, index) {
          final barbeiro = barbeiros[index];
          return ListTile(
            title: Text(barbeiro.nome),
            subtitle: Text('ID: ${barbeiro.id}'),
          );
        },
      ),
    );
  }
}
