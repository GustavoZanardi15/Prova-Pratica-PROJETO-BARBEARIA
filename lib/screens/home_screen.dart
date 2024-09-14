import 'package:flutter/material.dart';
import 'listagem_screen.dart';
import 'formulario_screen.dart';
import 'dashboard_screen.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}) : super (key: key);


@override
 _HomeScreenState createState() => _HomeScreenState();  
}

class _HomeScreenState extends State<HomeScreen>{
  int _currentIndex =0;
  final List<Widget> _screens = [
    const ListagemScreen(),
    const FormularioScreen(),
    const DashboardScreen(),
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barbearia App'),
      ),
    body: _screens[_currentIndex],
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: _currentIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'Listagem',
          ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_add),
        label: 'Cadastro',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          label: 'Dashboard',
          ),
      ],
      onTap: (index){
        setState((){
          _currentIndex = index;
        });
      }
    ),
    );
  }
}
