// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app_bombeiros_v3/main.dart';
import 'package:app_bombeiros_v3/presentation/vistorias/screens/smsci_points_screen.dart';

void main() {
  testWidgets('App initialization smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const FireInspectionApp());

    // Verify that our app has loaded correctly
    expect(find.byType(MaterialApp), findsOneWidget);
    
    // Verify that the SMSCIPointsScreen is loaded
    expect(find.byType(SMSCIPointsScreen), findsOneWidget);
    
    // Verify that at least some widgets are rendered
    expect(find.byType(Column), findsWidgets);
    expect(find.byType(AppBar), findsAtLeastNWidgets(0));
  });
}
