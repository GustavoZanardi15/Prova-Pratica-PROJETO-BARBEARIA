import 'package:barbearia/models/barbeiro.dart';
import 'package:barbearia/services/database_helper.dart';

class BarbeiroService {
  static final BarbeiroService instance = BarbeiroService._privateConstructor();

  BarbeiroService._privateConstructor();

  Future<void> adicionarBarbeiro(Barbeiro barbeiro) async {
    final db = await DatabaseHelper.instance.database;
    await db.insert('barbeiros', {'id': barbeiro.id, 'nome': barbeiro.nome});
  }

  Future<List<Barbeiro>> getBarbeiros() async {
    final db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> maps = await db.query('barbeiros');

    return List.generate(maps.length, (i) {
      return Barbeiro.fromJson(maps[i]);
    });
  }

  Future<void> updateBarbeiro(Barbeiro barbeiro) async {
    final db = await DatabaseHelper.instance.database;
    await db.update(
      'barbeiros',
      {'id': barbeiro.id, 'nome': barbeiro.nome},
      where: 'id = ?',
      whereArgs: [barbeiro.id],
    );
  }

  Future<void> deleteBarbeiro(int id) async {
    final db = await DatabaseHelper.instance.database;
    await db.delete(
      'barbeiros',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
