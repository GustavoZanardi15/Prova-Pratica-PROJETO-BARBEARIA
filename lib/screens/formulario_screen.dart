import 'package:flutter/material.dart';
import 'package:barbearia/models/barbeiro.dart';
import 'package:barbearia/services/barbeiro_service.dart';

class FormularioScreen extends StatefulWidget {
  const FormularioScreen({Key? key}) : super(key: key);

  @override
  _FormularioScreenState createState() => _FormularioScreenState();
}

class _FormularioScreenState extends State<FormularioScreen> {
  final _nomeController = TextEditingController();
  final _barbeiroService = BarbeiroService();

  void _adicionarBarbeiro() {
    final nome = _nomeController.text;
    final id = DateTime.now().millisecondsSinceEpoch; // Gerar ID simples
    final barbeiro = Barbeiro(id, nome);
    _barbeiroService.adicionarBarbeiro(barbeiro);

    Navigator.pop(context); // Voltar para a tela anterior
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Barbeiro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _adicionarBarbeiro,
              child: const Text('Adicionar'),
            ),
          ],
        ),
      ),
    );
  }
}
