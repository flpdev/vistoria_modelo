import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentation/vistorias/screens/vistorias_screen.dart';

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
      home: const VistoriasScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
