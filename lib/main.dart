import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:sqflite/sqflite.dart'; // Importação do sqflite
import 'package:sqflite_common_ffi/sqflite_ffi.dart'; // Importação do sqflite_common_ffi
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart'; // Importação do sqflite_common_ffi_web
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:barbearia/screens/listagem_screen.dart'; // Corrigido
import 'package:barbearia/screens/dashboard_screen.dart';
import 'package:barbearia/screens/formulario_screen.dart'; // Corrigido
import 'package:barbearia/screens/home_screen.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa o databaseFactory baseado no ambiente
  if (kIsWeb) {
    databaseFactory = databaseFactoryFfiWeb; // Para web
  } else {
    databaseFactory = databaseFactoryFfi; // Para desktop
  }

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

  // Use o openDatabase do sqflite
  final database = await databaseFactory.openDatabase(
    path,
    options: OpenDatabaseOptions(
      version: 1,
      onCreate: (db, version) async {
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
    ),
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
