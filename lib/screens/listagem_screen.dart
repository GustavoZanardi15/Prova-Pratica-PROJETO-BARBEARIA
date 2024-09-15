import 'package:flutter/material.dart';
import 'package:barbearia/models/servico.dart';
import 'package:barbearia/services/servico_service.dart';

class ListagemScreen extends StatefulWidget {
  const ListagemScreen({Key? key}) : super(key: key);

  @override
  _ListagemScreenState createState() => _ListagemScreenState();
}

class _ListagemScreenState extends State<ListagemScreen> {
  late Future<List<Servico>> _servicosFuture;

  @override
  void initState() {
    super.initState();
    _servicosFuture = ServicoService.instance.getServicos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listagem de Serviços'),
      ),
      body: FutureBuilder<List<Servico>>(
        future: _servicosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum serviço encontrado.'));
          }

          final servicos = snapshot.data!;

          return ListView.builder(
            itemCount: servicos.length,
            itemBuilder: (context, index) {
              final servico = servicos[index];
              return ListTile(
                title: Text(servico.nome),
                subtitle: Text(servico.descricao),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    // Lógica para deletar o serviço
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
