import 'package:barbearia/models/cliente.dart';
import 'package:barbearia/services/database_helper.dart';

class ClienteService {
  static final ClienteService instance = ClienteService._privateConstructor();

  ClienteService._privateConstructor();

  Future<void> adicionarCliente(Cliente cliente) async {
    final db = await DatabaseHelper.instance.database;
    await db.insert('clientes', {'id': cliente.id, 'nome': cliente.nome});
  }

  Future<List<Cliente>> getClientes() async {
    final db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> maps = await db.query('clientes');

    return List.generate(maps.length, (i) {
      return Cliente.fromJson(maps[i]);
    });
  }

  Future<void> updateCliente(Cliente cliente) async {
    final db = await DatabaseHelper.instance.database;
    await db.update(
      'clientes',
      {'id': cliente.id, 'nome': cliente.nome},
      where: 'id = ?',
      whereArgs: [cliente.id],
    );
  }

  Future<void> deleteCliente(int id) async {
    final db = await DatabaseHelper.instance.database;
    await db.delete(
      'clientes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
