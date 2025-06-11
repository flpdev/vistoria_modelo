import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_bombeiros_v3/presentation/vistorias/widgets/irv_tables_modal.dart';

/// Testes de widget para o modal de tabelas da IRV
void main() {
  testWidgets('IRVTablesModal should be created successfully', 
      (WidgetTester tester) async {
    // Arrange & Act
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return Center(
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => IRVTablesModal(
                        selectedItems: const [],
                        onSave: (_) {},
                      ),
                    );
                  },
                  child: const Text('Open Modal'),
                ),
              );
            },
          ),
        ),
      ),
    );

    // Abre o modal
    await tester.tap(find.text('Open Modal'));
    await tester.pumpAndSettle();
    
    // Assert - verifica se o modal foi criado
    expect(find.byType(IRVTablesModal), findsOneWidget);
    expect(find.text('Editar Tabelas da IRV'), findsOneWidget);
  });

  testWidgets('IRVTablesModal should show list of items', 
      (WidgetTester tester) async {
    // Arrange & Act
    await tester.pumpWidget(
      MaterialApp(
        home: IRVTablesModal(
          selectedItems: const [],
          onSave: (_) {},
        ),
      ),
    );
    
    // Assert - verifica se a lista de itens é exibida
    expect(find.byType(CheckboxListTile), findsWidgets);
    // Verifica alguns itens específicos da lista
    expect(find.text('Documentos específicos dos SMSCI'), findsOneWidget);
    expect(find.text('Saídas de emergência'), findsOneWidget);
  });

  testWidgets('IRVTablesModal should handle item selection', 
      (WidgetTester tester) async {
    // Arrange
    List<String> selectedItems = [];
    
    await tester.pumpWidget(
      MaterialApp(
        home: IRVTablesModal(
          selectedItems: selectedItems,
          onSave: (items) {
            selectedItems = items;
          },
        ),
      ),
    );
    
    // Act - seleciona um item
    await tester.tap(find.text('Documentos específicos dos SMSCI'));
    await tester.pumpAndSettle();
    
    // Clica no botão Concluir
    await tester.tap(find.text('Concluir'));
    await tester.pumpAndSettle();
    
    // Assert - verifica se o item foi selecionado
    expect(selectedItems.isNotEmpty, true);
  });

  testWidgets('IRVTablesModal should close when Cancel button is clicked', 
      (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return Center(
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => IRVTablesModal(
                        selectedItems: const [],
                        onSave: (_) {},
                      ),
                    );
                  },
                  child: const Text('Open Modal'),
                ),
              );
            },
          ),
        ),
      ),
    );

    // Abre o modal
    await tester.tap(find.text('Open Modal'));
    await tester.pumpAndSettle();
    
    // Act - clica no botão Cancelar
    await tester.tap(find.text('Cancelar'));
    await tester.pumpAndSettle();
    
    // Assert - verifica se o modal foi fechado
    expect(find.byType(IRVTablesModal), findsNothing);
  });
}
