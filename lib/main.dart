import 'package:barbearia/models/cliente.dart';
import 'package:barbearia/services/cliente_service.dart';

void main() {
  // Criando uma instância do ClienteService
  final clienteService = ClienteService();

  // Criando alguns clientes
  final cliente1 = Cliente(1, "Maria", []);
  final cliente2 = Cliente(2, "João", []);
  final cliente3 = Cliente(3, "Ana", []);

  // Adicionando clientes
  clienteService.adicionarCliente(cliente1);
  clienteService.adicionarCliente(cliente2);
  clienteService.adicionarCliente(cliente3);

  // Listando clientes após adição
  print("Clientes após adição:");
  clienteService.getClientes().forEach((cliente) => print(cliente));

  // Atualizando um cliente
  final clienteAtualizado = Cliente(2, "João Silva", []);
  clienteService.updateCliente(2, clienteAtualizado);

  // Listando clientes após atualização
  print("\nClientes após atualização:");
  clienteService.getClientes().forEach((cliente) => print(cliente));

  // Removendo um cliente
  clienteService.deleteCliente(1);

  // Listando clientes após remoção
  print("\nClientes após remoção:");
  clienteService.getClientes().forEach((cliente) => print(cliente));
}
