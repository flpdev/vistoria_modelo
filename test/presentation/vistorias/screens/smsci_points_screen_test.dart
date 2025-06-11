import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_bombeiros_v3/presentation/vistorias/screens/smsci_points_screen.dart';
import 'package:app_bombeiros_v3/presentation/vistorias/widgets/irv_tables_modal.dart';
import 'package:app_bombeiros_v3/presentation/vistorias/widgets/smsci_card_widget.dart';

/// Testes de widget para a tela SMSCIPointsScreen
void main() {
  testWidgets('SMSCIPointsScreen should be created successfully', 
      (WidgetTester tester) async {
    // Arrange & Act
    await tester.pumpWidget(
      const MaterialApp(
        home: SMSCIPointsScreen(),
      ),
    );
    
    // Assert - verifica se a tela foi criada
    expect(find.byType(SMSCIPointsScreen), findsOneWidget);
  });
  
  testWidgets('SMSCIPointsScreen should show Apontamentos tab by default', 
      (WidgetTester tester) async {
    // Arrange & Act
    await tester.pumpWidget(
      const MaterialApp(
        home: SMSCIPointsScreen(),
      ),
    );
    
    // Assert - verifica se a aba Apontamentos está selecionada por padrão
    expect(find.text('Apontamentos'), findsOneWidget);
    expect(find.text('Documentos'), findsOneWidget);
    expect(find.byType(SMSCICardWidget), findsWidgets); // Verifica se os cards SMSCI são exibidos
  });
  
  testWidgets('SMSCIPointsScreen should switch to Documentos tab when clicked', 
      (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      const MaterialApp(
        home: SMSCIPointsScreen(),
      ),
    );
    
    // Act - clica na aba Documentos
    await tester.tap(find.text('Documentos'));
    await tester.pumpAndSettle(); // Aguarda a animação terminar
    
    // Assert - verifica se a visualização mudou para a aba Documentos
    expect(find.text('Nome do documento no SCI / Nome do arquivo 1'), findsOneWidget);
    expect(find.text('Documento 01 de 04'), findsOneWidget);
    expect(find.byType(SMSCICardWidget), findsNothing); // Não deve mostrar os cards SMSCI na aba Documentos
  });
  
  testWidgets('SMSCIPointsScreen should open IRV Tables modal when button is clicked', 
      (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      const MaterialApp(
        home: SMSCIPointsScreen(),
      ),
    );
    
    // Act - clica no botão Tabelas da IRV
    await tester.tap(find.text('Tabelas da IRV'));
    await tester.pumpAndSettle(); // Aguarda a animação do modal
    
    // Assert - verifica se o modal foi aberto
    expect(find.byType(IRVTablesModal), findsOneWidget);
    expect(find.text('Tabelas da IRV'), findsOneWidget); // No botão
    expect(find.text('Editar Tabelas da IRV'), findsOneWidget); // No título do modal
    expect(find.text('Cancelar'), findsOneWidget);
    expect(find.text('Concluir'), findsOneWidget);
  });
}
