import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:app_bombeiros_v3/main.dart' as app;

/// Teste de integração básico para verificar se o aplicativo inicia corretamente
/// e se a navegação funciona conforme esperado.
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Testes de integração de ponta a ponta', () {
    testWidgets('Verificar se o app inicia e carrega a tela principal',
        (WidgetTester tester) async {
      // Inicia o app
      app.main();
      await tester.pumpAndSettle();

      // Verifica se a tela de apontamentos SMSCI foi carregada
      expect(find.byType(Scaffold), findsOneWidget);
      
      // Verifica se o título da tela está presente
      expect(find.text('Apontamentos por SMSCI'), findsOneWidget);
      
      // Verifica se pelo menos um card SMSCI está visível
      expect(find.byType(Card), findsAtLeastNWidgets(1));
    });
  });
}
