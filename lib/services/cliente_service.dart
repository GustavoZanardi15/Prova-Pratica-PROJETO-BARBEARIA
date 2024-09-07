import 'package:barbearia/models/cliente.dart';

class ClienteService {

  final List<Cliente> _clientes = [];

  void adicionarCliente(Cliente cliente){
    _clientes.add(cliente);
  }

  void updateCliente(int id , Cliente clienteUpdate){
  final index = _clientes.indexWhere((cliente)=> cliente.id == id);
   if(index != -1){
    _clientes[index] = clienteUpdate;
    }
  }

  void deleteCliente(int id){
    _clientes.removeWhere((cliente)=> cliente.id == id);
  }

  List<Cliente>getClientes(){
    return _clientes;
  }
  Cliente? getClienteById(int id) {
    return _clientes.firstWhere((cliente) => cliente.id == id, orElse: () => throw Exception("Cliente não enncontrado"));
  }
   
}