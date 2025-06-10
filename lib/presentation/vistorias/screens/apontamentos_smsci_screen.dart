import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import '../widgets/smsci_card_widget.dart';
import '../utils/app_styles.dart';

/// Tela de Apontamentos por SMSCI
/// 
/// Exibe os Sistemas e Medidas de Segurança Contra Incêndio e Pânico
/// para que o vistoriador possa registrar apontamentos de itens indeferidos.
class ApontamentosSMSCIScreen extends StatelessWidget {
  const ApontamentosSMSCIScreen({super.key});
  
  // Contexto de construção para navegação
  static late BuildContext _buildContext;

  @override
  Widget build(BuildContext context) {
    // Salva o contexto para uso em navegação
    _buildContext = context;
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _construirCabecalho(),
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: AppStyles.contentMaxWidth),
                    child: _construirConteudo(),
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
  Widget _construirCabecalho() {
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

  Widget _construirConteudo() {
    return Column(
      // display: flex, flex-direction: column no CSS equivale a Column no Flutter
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center, // align-items: center
      children: [
        _construirCabecalhoVistoria(),
        const SizedBox(height: AppStyles.spacingExtraLarge), // gap: 2.5rem (40px)
        _construirAbas(),
        const SizedBox(height: AppStyles.spacingExtraLarge), // gap: 2.5rem (40px)
        _construirInstrucoes(),
        const SizedBox(height: AppStyles.spacingExtraLarge), // gap: 2.5rem (40px)
        _construirSecaoSMSCI(),
      ],
    );
  }

  /// Constrói o cabeçalho com informações da vistoria e botão de concluir
  Widget _construirCabecalhoVistoria() {
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

  Widget _construirAbas() {
    return Row(
      children: [
        Expanded(
          child: _construirAba(
            titulo: 'Apontamentos',
            selecionada: true,
          ),
        ),
        Expanded(
          child: _construirAba(
            titulo: 'Documentos',
            selecionada: false,
          ),
        ),
      ],
    );
  }

  /// Constrói uma aba para a navegação entre seções
  /// 
  /// [titulo] - Título da aba
  /// [selecionada] - Indica se a aba está selecionada
  Widget _construirAba({required String titulo, required bool selecionada}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppStyles.spacingSmall),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: selecionada ? AppStyles.primaryOrange : Colors.transparent,
            width: 2,
          ),
        ),
      ),
      child: Text(
        titulo,
        style: selecionada ? AppStyles.tabSelected : AppStyles.tabUnselected,
      ),
    );
  }

  Widget _construirInstrucoes() {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Aponte apenas os itens indeferidos.',
            style: AppStyles.bodyLarge,
          ),
        ),
        OutlinedButton.icon(
          onPressed: () {},
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

  Widget _construirSecaoSMSCI() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sistemas e Medidas de Segurança Contra Incêndio e Pânico (SMSCI)',
          style: AppStyles.titleMedium,
        ),
        const SizedBox(height: 8),
        _construirGridSMSCI(),
      ],
    );
  }

  /// Constrói o grid de cards SMSCI com layout responsivo
  Widget _construirGridSMSCI() {
    try {
      final List<ItemSMSCI> itensSMSCI = _obterListaSMSCI();
      
      return Wrap(
        alignment: WrapAlignment.start,
        runAlignment: WrapAlignment.start,
        spacing: AppStyles.spacingLarge, // Espaçamento horizontal entre cards
        runSpacing: AppStyles.spacingLarge, // Espaçamento vertical entre linhas de cards
        children: itensSMSCI.map((item) => SMSCICardWidget(
          titulo: item.titulo,
          onTap: () => _navegarParaDetalhesSMSCI(item),
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

  /// Retorna a lista completa de itens SMSCI
  List<ItemSMSCI> _obterListaSMSCI() {
    // Combina todas as categorias de SMSCI
    return [
      ..._obterDocumentacao(),
      ..._obterCaracteristicasEdificacao(),
      ..._obterSistemasCombateIncendio(),
      ..._obterSistemasDeteccaoAlarme(),
      ..._obterSistemasProtecaoEstrutural(),
      ..._obterInstalacoesGasEletricas(),
      ..._obterAreasEspecificas(),
      ..._obterPlanosEBrigadas(),
    ];
  }

  /// Retorna itens SMSCI relacionados à documentação
  List<ItemSMSCI> _obterDocumentacao() {
    return [
      ItemSMSCI(titulo: 'Documentos específicos dos SMSCI'),
    ];
  }

  /// Retorna itens SMSCI relacionados às características da edificação
  List<ItemSMSCI> _obterCaracteristicasEdificacao() {
    return [
      ItemSMSCI(titulo: 'Características gerais do Bloco'),
    ];
  }

  /// Retorna itens SMSCI relacionados aos sistemas de combate a incêndio
  List<ItemSMSCI> _obterSistemasCombateIncendio() {
    return [
      ItemSMSCI(titulo: 'Preventivo por extintores'),
      ItemSMSCI(titulo: 'Hidráulico preventivo'),
      ItemSMSCI(titulo: 'Chuveiros automáticos (Sprinklers)'),
      ItemSMSCI(titulo: 'Água nebulizada'),
      ItemSMSCI(titulo: 'Fixo de gases limpos e dióxido de carbono'),
    ];
  }

  /// Retorna itens SMSCI relacionados aos sistemas de detecção e alarme
  List<ItemSMSCI> _obterSistemasDeteccaoAlarme() {
    return [
      ItemSMSCI(titulo: 'Detecção e Alarme de Incêndio'),
      ItemSMSCI(titulo: 'Iluminação de Emergência'),
      ItemSMSCI(titulo: 'Sinalização para abandono de local'),
    ];
  }

  /// Retorna itens SMSCI relacionados aos sistemas de proteção estrutural
  List<ItemSMSCI> _obterSistemasProtecaoEstrutural() {
    return [
      ItemSMSCI(titulo: 'Proteção contra descargas atmosféricas (SPDA)'),
      ItemSMSCI(titulo: 'Controle de fumaça'),
      ItemSMSCI(titulo: 'Controle de materiais de acabamento e revestimento'),
      ItemSMSCI(titulo: 'Saídas de emergência'),
      ItemSMSCI(titulo: 'Acesso de viaturas'),
      ItemSMSCI(titulo: 'Compartimentação horizontal e vertical'),
    ];
  }

  /// Retorna itens SMSCI relacionados às instalações de gás e elétricas
  List<ItemSMSCI> _obterInstalacoesGasEletricas() {
    return [
      ItemSMSCI(titulo: 'Instalações de gás combustível'),
      ItemSMSCI(titulo: 'Instalações elétricas de baixa tensão'),
      ItemSMSCI(titulo: 'Comercialização de Gás combustível e armazenamento de recipiente'),
    ];
  }

  /// Retorna itens SMSCI relacionados às áreas específicas
  List<ItemSMSCI> _obterAreasEspecificas() {
    return [
      ItemSMSCI(titulo: 'Parque para armazenamentos de líquidos inflamáveis e combustíveis'),
      ItemSMSCI(titulo: 'Rede pública de hidrantes'),
      ItemSMSCI(titulo: 'Pátio de contêineres'),
      ItemSMSCI(titulo: 'Locais onde a liberdade das pessoas sofre restrições'),
      ItemSMSCI(titulo: 'Fogos de artifícios, explosivos e munições'),
      ItemSMSCI(titulo: 'Piscinas e áreas recreativas com opção aquática de lazer'),
      ItemSMSCI(titulo: 'Estufa de secagem e silos'),
    ];
  }

  /// Retorna itens SMSCI relacionados aos planos e brigadas
  List<ItemSMSCI> _obterPlanosEBrigadas() {
    return [
      ItemSMSCI(titulo: 'Brigada de Incêndio'),
      ItemSMSCI(titulo: 'Plano de emergência'),
    ];
  }

  /// Navega para a tela de detalhes do SMSCI selecionado
  /// 
  /// [item] - O item SMSCI selecionado
  void _navegarParaDetalhesSMSCI(ItemSMSCI item) {
    try {
      // Registra a ação para facilitar a depuração
      developer.log('Navegando para detalhes de: ${item.titulo}');
      
      // Usa o contexto salvo para navegação
      Navigator.of(_buildContext).push(
        MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text('Detalhes: ${item.titulo}'),
              backgroundColor: AppStyles.primaryOrange,
              foregroundColor: Colors.white,
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(AppStyles.spacingMedium),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.info_outline,
                      size: 48,
                      color: AppStyles.primaryOrange,
                    ),
                    const SizedBox(height: AppStyles.spacingMedium),
                    Text(
                      'Detalhes do SMSCI: ${item.titulo}',
                      style: AppStyles.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppStyles.spacingLarge),
                    const Text(
                      'Aqui serão exibidos os detalhes e formulários para apontamentos deste item.',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    } catch (e) {
      // Tratamento de erro na navegação
      developer.log('Erro ao navegar para detalhes do SMSCI: ${item.titulo}', error: e, level: 1);
    }
  }
}

/// Modelo para representar um item de SMSCI
class ItemSMSCI {
  final String titulo;

  ItemSMSCI({
    required this.titulo,
  });
}
