import 'package:flutter/material.dart';
import '../utils/app_styles.dart';

/// Modal para edição das tabelas da IRV
class IRVTablesModal extends StatefulWidget {
  final List<String> selectedItems;
  final Function(List<String>) onSave;

  const IRVTablesModal({
    super.key,
    required this.selectedItems,
    required this.onSave,
  });

  @override
  State<IRVTablesModal> createState() => _IRVTablesModalState();
}

class _IRVTablesModalState extends State<IRVTablesModal> {
  late List<String> _selectedItems;
  
  // Lista completa de itens SMSCI
  final List<String> _allItems = [
    'Documentos específicos dos SMSCI',
    'Características gerais do Bloco',
    'Comercialização de gás combustível e armazenamento de recipientes transportáveis de GLP',
    'Piscinas e áreas recreativas com opção aquática de lazer',
    'Estufas de secagem e silos',
    'Preventivo por extintores',
    'Hidráulico preventivo',
    'Detecção e alarme de incêndio',
    'Iluminação de emergência',
    'Sinalização para abandono de local',
    'Chuveiros automáticos (sprinklers)',
    'Proteção contra descargas atmosféricas (SPDA)',
    'Controle de fumaça',
    'Fixo de gases limpos e dióxido de carbono',
    'Água nebulizada',
    'Controle de materiais de acabamento e revestimento',
    'Saídas de emergência',
    'Acesso de viaturas',
    'Compartimentação horizontal e vertical',
    'Instalações de gás combustível',
    'Instalações elétricas de baixa tensão',
    'Parque para armazenamentos de líquidos inflamáveis e combustíveis',
    'Rede pública de hidrantes',
    'Pátio de contêineres',
    'Locais onde a liberdade das pessoas sofre restrições',
    'Fogos de artifícios, explosivos e munições',
    'Brigada de incêndio',
    'Plano de emergência',
  ];

  @override
  void initState() {
    super.initState();
    _selectedItems = List.from(widget.selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(40),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      child: Container(
        width: 664,
        constraints: const BoxConstraints(maxHeight: 700),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 16),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  children: _buildCheckboxList(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Editar Tabelas da IRV',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  List<Widget> _buildCheckboxList() {
    return _allItems.map((item) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: CheckboxListTile(
          title: Text(
            item,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          value: _selectedItems.contains(item),
          onChanged: (bool? value) {
            setState(() {
              if (value == true) {
                if (!_selectedItems.contains(item)) {
                  _selectedItems.add(item);
                }
              } else {
                _selectedItems.remove(item);
              }
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: EdgeInsets.zero,
          dense: true,
        ),
      );
    }).toList();
  }

  Widget _buildFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          child: const Text(
            'Cancelar',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: () {
            widget.onSave(_selectedItems);
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppStyles.primaryOrange,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Concluir',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
