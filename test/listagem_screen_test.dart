import 'package:barbearia/models/servico.dart';
import 'package:barbearia/screens/listagem_screen.dart';
import 'package:barbearia/services/servico_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'listagem_screen_test.mocks.dart';

@GenerateMocks([ServicoService])
void main() {
  testWidgets('Exibe serviços corretamente após carregamento', (WidgetTester tester) async {
    final mockServicoService = MockServicoService();
    final servicos = [
      Servico(id: 1, nome: 'Corte de Cabelo', descricao: 'Corte simples'),
      Servico(id: 2, nome: 'Barba', descricao: 'Aparar a barba'),
    ];

    when(mockServicoService.getServicos()).thenAnswer((_) async => servicos);

    await tester.pumpWidget(
      MaterialApp(
        home: ListagemScreen(),
      ),
    );

    // Espera o CircularProgressIndicator enquanto carrega
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Espera finalização da FutureBuilder
    await tester.pumpAndSettle();

    // Verifica se os serviços foram exibidos corretamente
    expect(find.text('Corte de Cabelo'), findsOneWidget);
    expect(find.text('Barba'), findsOneWidget);
  });
}
