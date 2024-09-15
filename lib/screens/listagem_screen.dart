import 'package:flutter/material.dart';
import 'package:barbearia/services/servico_service.dart';

class ListagemScreen extends StatefulWidget {
  const ListagemScreen({Key? key}) : super(key: key);

  @override
  _ListagemScreenState createState() => _ListagemScreenState();
}

class _ListagemScreenState extends State<ListagemScreen> {
  @override
  Widget build(BuildContext context) {
    final servicos = ServicoService.instance.getServicos();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Serviços'),
      ),
      body: ListView.builder(
        itemCount: servicos.length,
        itemBuilder: (context, index) {
          final servico = servicos[index];
          return ListTile(
            title: Text(servico.nome),
            subtitle: Text('Preço: R\$${servico.preco.toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}
