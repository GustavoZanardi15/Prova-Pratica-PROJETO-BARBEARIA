import 'package:barbearia/models/servico.dart';
import 'package:barbearia/services/database_helper.dart';

class ServicoService {
  static final ServicoService instance = ServicoService._privateConstructor();

  ServicoService._privateConstructor();

  Future<void> adicionarServico(Servico servico) async {
    final db = await DatabaseHelper.instance.database;
    await db.insert('servicos', servico.toJson());
  }

  Future<List<Servico>> getServicos() async {
    final db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> maps = await db.query('servicos');

    return List.generate(maps.length, (i) {
      return Servico.fromJson(maps[i]);
    });
  }

  Future<void> updateServico(Servico servico) async {
    final db = await DatabaseHelper.instance.database;
    await db.update(
      'servicos',
      servico.toJson(),
      where: 'id = ?',
      whereArgs: [servico.id],
    );
  }

  Future<void> deleteServico(int id) async {
    final db = await DatabaseHelper.instance.database;
    await db.delete(
      'servicos',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
