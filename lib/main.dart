import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentation/vistorias/screens/smsci_points_screen.dart';

void main() {
  runApp(const ProviderScope(child: FireInspectionApp()));
}

class FireInspectionApp extends StatelessWidget {
  const FireInspectionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fire Department Inspection App',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      // Usando a tela de apontamentos SMSCI como tela inicial para visualização
      home: const SMSCIPointsScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
