import 'package:flutter/material.dart';
import 'package:barbearia/screens/home_screen.dart'; 
import 'package:barbearia/screens/listagem_screen.dart';
import 'package:barbearia/screens/formulario_screen.dart'; 
import 'package:barbearia/screens/dashboard_screen.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barbearia App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
      routes: {
        '/listagem': (context) => ListagemScreen(),
        '/formulario': (context) => FormularioScreen(), 
        '/dashboard': (context) => DashboardScreen(), 
      },
    );
  }
}
