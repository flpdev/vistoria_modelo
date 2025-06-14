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

  @override
  Widget build(BuildContext context) {
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
                    constraints: const BoxConstraints(maxWidth: 661), // 41.3125rem
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

  Widget _construirCabecalho() {
    return Container(
      height: 64, // 4rem
      padding: const EdgeInsets.all(AppStyles.spacingSmall), // 0.5rem
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 8),
          const Expanded(
            child: Text(
              'Vistoria em Andamento',
              style: TextStyle(
                color: AppStyles.darkGray,
                fontSize: 18,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
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

  Widget _construirCabecalhoVistoria() {
    return Padding(
      padding: const EdgeInsets.only(top: AppStyles.spacingMedium),
      child: Row(
        children: [
          const Icon(Icons.description, color: AppStyles.darkGray),
          const SizedBox(width: AppStyles.spacingSmall),
          Expanded(
            child: Text(
              'Vistoria de Funcionamento',
              style: const TextStyle(
                color: AppStyles.primaryOrange,
                fontSize: 18,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppStyles.successGreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
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

  Widget _construirAba({required String titulo, required bool selecionada}) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: selecionada ? const Color(0xFFE66F0E) : const Color(0xFF767676),
            width: selecionada ? 2 : 1,
          ),
        ),
      ),
      child: Center(
        child: Text(
          titulo,
          style: selecionada ? AppStyles.tabSelected : AppStyles.tabUnselected,
        ),
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

  Widget _construirGridSMSCI() {
    // Calculamos o número de colunas com base na largura disponível
    // Para 3 colunas com cards de 204.33px e espaçamento de 24px
    return Wrap(
      alignment: WrapAlignment.start,
      runAlignment: WrapAlignment.start,
      spacing: AppStyles.spacingLarge, // Espaçamento horizontal entre cards
      runSpacing: AppStyles.spacingLarge, // Espaçamento vertical entre linhas de cards
      children: _obterListaSMSCI().map((item) => SMSCICardWidget(
        titulo: item.titulo,
        onTap: () => _navegarParaDetalhesSMSCI(item),
      )).toList(),
    );
  }

  List<ItemSMSCI> _obterListaSMSCI() {
    return [
      ItemSMSCI(
        titulo: 'Documentos específicos dos SMSCI',
      ),
      ItemSMSCI(
        titulo: 'Características gerais do Bloco',
      ),
      ItemSMSCI(
        titulo: 'Comercialização de Gás combustível e armazenamento de recipiente',
      ),
      ItemSMSCI(
        titulo: 'Piscinas e áreas recreativas com opção aquática de lazer',
      ),
      ItemSMSCI(
        titulo: 'Estufa de secagem e silos',
      ),
      ItemSMSCI(
        titulo: 'Preventivo por extintores',
      ),
      ItemSMSCI(
        titulo: 'Hidráulico preventivo',
      ),
      ItemSMSCI(
        titulo: 'Detecção e Alarme de Incêndio',
      ),
      ItemSMSCI(
        titulo: 'Iluminação de Emergência',
      ),
      ItemSMSCI(
        titulo: 'Sinalização para abandono de local',
      ),
      ItemSMSCI(
        titulo: 'Chuveiros automáticos (Sprinklers)',
      ),
      ItemSMSCI(
        titulo: 'Proteção contra descargas atmosféricas (SPDA)',
      ),
      ItemSMSCI(
        titulo: 'Controle de fumaça',
      ),
      ItemSMSCI(
        titulo: 'Fixo de gases limpos e dióxido de carbono',
      ),
      ItemSMSCI(
        titulo: 'Água nebulizada',
      ),
      ItemSMSCI(
        titulo: 'Controle de materiais de acabamento e revestimento',
      ),
      ItemSMSCI(
        titulo: 'Saídas de emergência',
      ),
      ItemSMSCI(
        titulo: 'Acesso de viaturas',
      ),
      ItemSMSCI(
        titulo: 'Compartimentação horizontal e vertical',
      ),
      ItemSMSCI(
        titulo: 'Instalações de gás combustível',
      ),
      ItemSMSCI(
        titulo: 'Instalações elétricas de baixa tensão',
      ),
      ItemSMSCI(
        titulo: 'Parque para armazenamentos de líquidos inflamáveis e combustíveis',
      ),
      ItemSMSCI(
        titulo: 'Rede pública de hidrantes',
      ),
      ItemSMSCI(
        titulo: 'Pátio de contêineres',
      ),
      ItemSMSCI(
        titulo: 'Locais onde a liberdade das pessoas sofre restrições',
      ),
      ItemSMSCI(
        titulo: 'Fogos de artifícios, explosivos e munições',
      ),
      ItemSMSCI(
        titulo: 'Brigada de Incêndio',
      ),
      ItemSMSCI(
        titulo: 'Plano de emergência',
      ),
    ];
  }

  void _navegarParaDetalhesSMSCI(ItemSMSCI item) {
    // Implementação da navegação para a tela de detalhes do SMSCI
    developer.log('Navegando para detalhes de: ${item.titulo}');
  }
}

/// Modelo para representar um item de SMSCI
class ItemSMSCI {
  final String titulo;

  ItemSMSCI({
    required this.titulo,
  });
}
