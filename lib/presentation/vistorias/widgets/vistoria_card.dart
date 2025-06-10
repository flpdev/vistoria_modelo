import 'package:flutter/material.dart';
import '../../../domain/vistorias/entities/vistoria.dart';

class InspectionCard extends StatelessWidget {
  final Vistoria vistoria;

  const InspectionCard({super.key, required this.vistoria});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 2,
      child: ListTile(
        title: Text(
          vistoria.type,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(vistoria.address),
        trailing: Text(
          vistoria.status,
          style: TextStyle(
            color: vistoria.status == 'Em andamento'
                ? Colors.orange
                : vistoria.status == 'Concluída'
                ? Colors.green
                : Colors.grey,
          ),
        ),
      ),
    );
  }
}
