import 'package:flutter/material.dart';
import 'package:barbearia/models/servico.dart';
import 'package:barbearia/services/servico_service.dart';

class FormularioScreen extends StatefulWidget {
  const FormularioScreen({Key? key}) : super(key: key);

  @override
  _FormularioScreenState createState() => _FormularioScreenState();
}

class _FormularioScreenState extends State<FormularioScreen> {
  final _nomeController = TextEditingController();
  final _precoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Serviço'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: 'Nome do Serviço'),
            ),
            TextField(
              controller: _precoController,
              decoration: const InputDecoration(labelText: 'Preço'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                final nome = _nomeController.text;
                final preco = double.tryParse(_precoController.text) ?? 0.0;

                final servico = Servico(DateTime.now().millisecondsSinceEpoch, nome, preco);
                ServicoService.instance.adicionarServico(servico);

                // Navegue de volta para a tela anterior ou atualize a tela
                Navigator.pop(context);
              },
              child: const Text('Adicionar Serviço'),
            ),
          ],
        ),
      ),
    );
  }
}
