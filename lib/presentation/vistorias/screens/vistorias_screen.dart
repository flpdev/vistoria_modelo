import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/vistorias_provider.dart';
import '../widgets/vistoria_card.dart';

class VistoriasScreen extends ConsumerWidget {
  const VistoriasScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(vistoriasProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Vistorias'), centerTitle: true),
      body: state.state == VistoriasState.loading
          ? const Center(child: CircularProgressIndicator())
          : state.state == VistoriasState.error
          ? Center(
              child: Text(
                state.errorMessage ?? 'Erro desconhecido',
                style: const TextStyle(color: Colors.red),
              ),
            )
          : ListView.builder(
              itemCount: state.vistorias.length,
              itemBuilder: (context, index) {
                final v = state.vistorias[index];
                return VistoriaCard(vistoria: v);
              },
            ),
    );
  }
}
