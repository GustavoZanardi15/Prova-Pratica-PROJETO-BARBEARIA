import 'package:flutter/material.dart';
import 'package:barbearia/models/servico.dart';
import 'package:barbearia/services/servico_service.dart';

class FormularioScreen extends StatelessWidget {
  const FormularioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController nomeController = TextEditingController();
    final TextEditingController precoController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Serviço'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(labelText: 'Nome do Serviço'),
            ),
            TextField(
              controller: precoController,
              decoration: const InputDecoration(labelText: 'Preço'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                final nome = nomeController.text;
                final descricao = precoController.text;
                if (nome.isNotEmpty && descricao.isNotEmpty) {
                  final servico = Servico(
                    id: DateTime.now().millisecondsSinceEpoch,
                    nome: nome,
                    descricao: descricao,
                  );
                  ServicoService.instance.adicionarServico(servico).then((_) {
                    Navigator.pop(context);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Serviço adicionado')),
                  );
                }
              },
              child: const Text('Adicionar Serviço'),
            ),
          ],
        ),
      ),
    );
  }
}
