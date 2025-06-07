import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentation/vistorias/screens/apontamentos_smsci_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Vistorias Bombeiro',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      // Usando a tela de apontamentos SMSCI como tela inicial para visualização
      home: const ApontamentosSMSCIScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
