import 'package:barbearia/screens/listagem_screen.dart';
import 'package:barbearia/screens/formulario_screen.dart';
import 'package:barbearia/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:barbearia/screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await initializeDatabase();
  } catch (e) {
    print('Erro ao inicializar o banco de dados: $e');
  }
  runApp(MyApp());
}

Future<void> initializeDatabase() async {
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path = join(documentsDirectory.path, 'barbearia.db');
  await openDatabase(
    path,
    version: 1,
    onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE barbeiros (
          id INTEGER PRIMARY KEY,
          nome TEXT
        )
      ''');
      await db.execute('''
        CREATE TABLE clientes (
          id INTEGER PRIMARY KEY,
          nome TEXT
        )
      ''');
    },
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barbearia App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(), // Verifique se a HomeScreen está definida corretamente
      routes: {
        '/listagem': (context) => ListagemScreen(),
        '/formulario': (context) => FormularioScreen(),
        '/dashboard': (context) => DashboardScreen(),
      },
    );
  }
}
