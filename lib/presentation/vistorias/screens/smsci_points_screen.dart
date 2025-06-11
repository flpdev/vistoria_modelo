import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import '../widgets/smsci_card_widget.dart';
import '../widgets/irv_tables_modal.dart';
import '../utils/app_styles.dart';

/// Tela de Apontamentos por SMSCI
/// 
/// Exibe os Sistemas e Medidas de Segurança Contra Incêndio e Pânico
/// para que o vistoriador possa registrar apontamentos de itens indeferidos.
class SMSCIPointsScreen extends StatefulWidget {
  final String? inspectionId;
  
  const SMSCIPointsScreen({super.key, this.inspectionId});

  @override
  State<SMSCIPointsScreen> createState() => _SMSCIPointsScreenState();
}

class _SMSCIPointsScreenState extends State<SMSCIPointsScreen> {
  // Lista de itens SMSCI selecionados para as tabelas da IRV
  List<String> _selectedIRVItems = [];

  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: AppStyles.contentMaxWidth),
                    child: _buildContent(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Constrói o cabeçalho da tela com título e botão de voltar
  Widget _buildHeader() {
    return Container(
      height: AppStyles.headerHeight,
      padding: const EdgeInsets.all(AppStyles.spacingSmall),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: AppStyles.iconSizeLarge,
            height: AppStyles.iconSizeLarge,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                // Registra a ação para facilitar a depuração
                developer.log('Voltando da tela de apontamentos SMSCI');
              },
            ),
          ),
          SizedBox(width: AppStyles.spacingSmall),
          const Expanded(
            child: Text(
              'Vistoria em Andamento',
              style: AppStyles.titleLarge,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      // display: flex, flex-direction: column no CSS equivale a Column no Flutter
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center, // align-items: center
      children: [
        _buildInspectionHeader(),
        const SizedBox(height: AppStyles.spacingExtraLarge), // gap: 2.5rem (40px)
        _buildTabs(),
        const SizedBox(height: AppStyles.spacingExtraLarge), // gap: 2.5rem (40px)
        _buildInstructions(),
        const SizedBox(height: AppStyles.spacingExtraLarge), // gap: 2.5rem (40px)
        _buildSMSCISection(),
      ],
    );
  }

  /// Constrói o cabeçalho com informações da vistoria e botão de concluir
  Widget _buildInspectionHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: AppStyles.spacingMedium),
      child: Row(
        children: [
          const Icon(Icons.description, color: AppStyles.darkGray),
          SizedBox(width: AppStyles.spacingSmall),
          const Expanded(
            child: Text(
              'Vistoria de Funcionamento',
              style: TextStyle(
                color: AppStyles.primaryOrange,
                fontSize: 18,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Registra a ação para facilitar a depuração
              developer.log('Botão Concluir Vistoria pressionado');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppStyles.successGreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppStyles.borderRadiusCircular),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            ),
            child: const Text(
              'Concluir Vistoria',
              style: AppStyles.buttonText,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Row(
      children: [
        Expanded(
          child: _buildTab(
            title: 'Apontamentos',
            selected: true,
          ),
        ),
        Expanded(
          child: _buildTab(
            title: 'Documentos',
            selected: false,
          ),
        ),
      ],
    );
  }

  /// Constrói uma aba para a navegação entre seções
  /// 
  /// [title] - Título da aba
  /// [selected] - Indica se a aba está selecionada
  Widget _buildTab({required String title, required bool selected}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppStyles.spacingSmall),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: selected ? AppStyles.primaryOrange : Colors.transparent,
            width: 2,
          ),
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: selected ? AppStyles.tabSelected : AppStyles.tabUnselected,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildInstructions() {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Aponte apenas os itens indeferidos.',
            style: AppStyles.bodyLarge,
          ),
        ),
        OutlinedButton.icon(
          onPressed: () {
            _showIRVTablesModal();
          },
          icon: const Icon(Icons.table_chart, size: 18),
          label: const Text('Tabelas da IRV'),
          style: OutlinedButton.styleFrom(
            foregroundColor: AppStyles.primaryOrange,
            side: const BorderSide(color: AppStyles.primaryOrange),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSMSCISection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sistemas e Medidas de Segurança Contra Incêndio e Pânico (SMSCI)',
          style: AppStyles.titleMedium,
        ),
        const SizedBox(height: 8),
        _buildSMSCIGrid(),
      ],
    );
  }

  /// Exibe o modal de tabelas da IRV
  void _showIRVTablesModal() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return IRVTablesModal(
          selectedItems: _selectedIRVItems,
          onSave: (selectedItems) {
            setState(() {
              _selectedIRVItems = selectedItems;
              developer.log('Itens selecionados: $_selectedIRVItems');
            });
          },
        );
      },
    );
  }

  /// Constrói o grid de cards SMSCI com layout responsivo
  Widget _buildSMSCIGrid() {
    try {
      final List<String> smscItems = _getSMSCIItems();
      
      return Wrap(
        alignment: WrapAlignment.start,
        runAlignment: WrapAlignment.start,
        spacing: AppStyles.spacingLarge, // Espaçamento horizontal entre cards
        runSpacing: AppStyles.spacingLarge, // Espaçamento vertical entre linhas de cards
        children: smscItems.map((title) => SMSCICardWidget(
          title: title,
          onTap: () => _openSMSCIDetails(title),
        )).toList(),
      );
    } catch (e) {
      // Em caso de erro na construção do grid, exibe uma mensagem de erro
      developer.log('Erro ao construir grid SMSCI', error: e);
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(AppStyles.spacingLarge),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, color: AppStyles.errorRed, size: 48),
              SizedBox(height: AppStyles.spacingMedium),
              const Text(
                'Ocorreu um erro ao carregar os itens SMSCI',
                style: TextStyle(color: AppStyles.errorRed),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }
  }

  /// Obtém a lista de itens SMSCI para exibição
  List<String> _getSMSCIItems() {
    // Combina todas as categorias de SMSCI
    return [
      ..._getDocumentation(),
      ..._getBuildingCharacteristics(),
      ..._getFireExtinguishingSystems(),
      ..._getDetectionAlarmSystems(),
      ..._getStructuralProtectionSystems(),
      ..._getGasElectricalInstallations(),
      ..._getSpecificAreas(),
      ..._getPlansAndBrigades(),
    ];
  }

  /// Retorna itens SMSCI relacionados à documentação
  List<String> _getDocumentation() {
    return [
      'Documentos específicos dos SMSCI',
    ];
  }

  /// Retorna itens SMSCI relacionados às características da edificação
  List<String> _getBuildingCharacteristics() {
    return [
      'Características gerais do Bloco',
    ];
  }

  /// Retorna itens SMSCI relacionados aos sistemas de combate a incêndio
  List<String> _getFireExtinguishingSystems() {
    return [
      'Preventivo por extintores',
      'Hidráulico preventivo',
      'Chuveiros automáticos (Sprinklers)',
      'Água nebulizada',
      'Fixo de gases limpos e dióxido de carbono',
    ];
  }

  /// Retorna itens SMSCI relacionados aos sistemas de detecção e alarme
  List<String> _getDetectionAlarmSystems() {
    return [
      'Detecção e Alarme de Incêndio',
      'Iluminação de Emergência',
      'Sinalização para abandono de local',
    ];
  }

  /// Retorna itens SMSCI relacionados aos sistemas de proteção estrutural
  List<String> _getStructuralProtectionSystems() {
    return [
      'Proteção contra descargas atmosféricas (SPDA)',
      'Controle de fumaça',
      'Controle de materiais de acabamento e revestimento',
      'Saídas de emergência',
      'Acesso de viaturas',
      'Compartimentação horizontal e vertical',
    ];
  }

  /// Retorna itens SMSCI relacionados às instalações de gás e elétricas
  List<String> _getGasElectricalInstallations() {
    return [
      'Instalações de gás combustível',
      'Instalações elétricas de baixa tensão',
      'Comercialização de Gás combustível e armazenamento de recipiente',
    ];
  }

  /// Retorna itens SMSCI relacionados às áreas específicas
  List<String> _getSpecificAreas() {
    return [
      'Parque para armazenamentos de líquidos inflamáveis e combustíveis',
      'Rede pública de hidrantes',
      'Pátio de contêineres',
      'Locais onde a liberdade das pessoas sofre restrições',
      'Fogos de artifícios, explosivos e munições',
      'Piscinas e áreas recreativas com opção aquática de lazer',
      'Estufa de secagem e silos',
    ];
  }

  /// Retorna itens SMSCI relacionados aos planos e brigadas
  List<String> _getPlansAndBrigades() {
    return [
      'Brigada de Incêndio',
      'Plano de emergência',
    ];
  }

  /// Abre a tela de detalhes do item SMSCI selecionado
  void _openSMSCIDetails(String title) {
    // Registra a ação para facilitar a depuração
    developer.log('Abrindo detalhes do item SMSCI: $title');
    
    // Aqui seria implementada a navegação para a tela de detalhes
    // Navigator.push(context, MaterialPageRoute(...));
  }
}
