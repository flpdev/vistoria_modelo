import 'dart:developer' as developer;

/// Classe utilitária para mapear os nomes dos ícones SMSCI para os arquivos SVG
///
/// Esta classe fornece um mapeamento padronizado entre os nomes dos itens SMSCI
/// e os respectivos arquivos SVG, garantindo consistência na exibição dos ícones.
class SMSCIIcons {
  // Mapeamentos por categoria para reduzir complexidade
  static final Map<String, String> _documentation = {
    'Documentos específicos dos SMSCI': 'icons/Documentos_especificos_dos_SMSCI.svg',
  };

  static final Map<String, String> _buildingCharacteristics = {
    'Características gerais do Bloco': 'icons/caracteristicas_gerais_do_bloco.svg',
  };

  static final Map<String, String> _fireExtinguishingSystems = {
    'Preventivo por extintores': 'icons/preventivo_por_extintores.svg',
    'Hidráulico preventivo': 'icons/hidraulico_preventivo.svg',
    'Chuveiros automáticos (Sprinklers)': 'icons/chuveiros_automaticos.svg',
    'Água nebulizada': 'icons/agua_nebulizada.svg',
    'Fixo de gases limpos e dióxido de carbono': 'icons/Fixo_de_gases_limpos_e_dioxido_de_carbono.svg',
  };

  static final Map<String, String> _detectionAlarmSystems = {
    'Detecção e Alarme de Incêndio': 'icons/deteccao_e_Alarme_de_Incendio.svg',
    'Iluminação de Emergência': 'icons/Iluminacao_de_Emergencia.svg',
    'Sinalização para abandono de local': 'icons/Sinalizacao_para_Abandono_de_Local.svg',
  };

  static final Map<String, String> _structuralProtectionSystems = {
    'Proteção contra descargas atmosféricas (SPDA)': 'icons/protecao_contra_descargas_atmosfericas.svg',
    'Controle de fumaça': 'icons/Controle_de_Fumaca.svg',
    'Controle de materiais de acabamento e revestimento': 'icons/controle_de_materiais_de_acabamento_e_revestimento.svg',
    'Saídas de emergência': 'icons/Saidas_de_Emergencia.svg',
    'Acesso de viaturas': 'icons/Acesso_de_viaturas.svg',
    'Compartimentação horizontal e vertical': 'icons/Compartimentacao_Horizontal_e_Vertical.svg',
  };

  static final Map<String, String> _gasElectricalInstallations = {
    'Instalações de gás combustível': 'icons/Instalacoes_de_gas_combustivel.svg',
    'Instalações elétricas de baixa tensão': 'icons/Instalacoes_eletricas_de_baixa_tensao.svg',
    'Comercialização de Gás combustível e armazenamento de recipiente': 'icons/comercializacao_gas.svg',
  };

  static final Map<String, String> _specificAreas = {
    'Parque para armazenamentos de líquidos inflamáveis e combustíveis': 'icons/parque_para_armazenamentos_de_liquidos_inflamaveis_e_combustiveis.svg',
    'Rede pública de hidrantes': 'icons/rede_publica_de_hidrantes.svg',
    'Pátio de contêineres': 'icons/patio_de_conteineres.svg',
    'Locais onde a liberdade das pessoas sofre restrições': 'icons/Locais_onde_a_liberdade_das_pessoas_sofre_restricoes.svg',
    'Fogos de artifícios, explosivos e munições': 'icons/Fogos_de_artificios_explosivos_e_municoes.svg',
    'Piscinas e áreas recreativas com opção aquática de lazer': 'icons/piscinas_e_areas_recreativas.svg',
    'Estufa de secagem e silos': 'icons/estufa_de_secagem_e_silos.svg',
  };

  static final Map<String, String> _plansAndBrigades = {
    'Brigada de Incêndio': 'icons/brigada_de_incendio.svg',
    'Plano de emergência': 'icons/plano_de_emergencia.svg',
  };

  /// Retorna o caminho do arquivo SVG para o tipo de SMSCI especificado
  /// 
  /// [tipoSMSCI] - O nome do tipo de SMSCI para o qual se deseja obter o ícone
  /// 
  /// Retorna o caminho do arquivo SVG correspondente ou um ícone padrão caso
  /// o tipo especificado não seja encontrado no mapeamento.
  /// Normaliza o nome do arquivo SVG para garantir consistência
  /// 
  /// [fileName] - Nome do arquivo a ser normalizado
  /// 
  /// Retorna o nome do arquivo normalizado
  static String _normalizeFileName(String fileName) {
    // Garante que o caminho comece com 'icons/' e termine com '.svg'
    if (!fileName.startsWith('icons/')) {
      fileName = 'icons/$fileName';
    }
    if (!fileName.endsWith('.svg')) {
      fileName = '$fileName.svg';
    }
    return fileName;
  }

  static String getIconPath(String smscType) {
    // Busca o ícone em cada categoria
    String? iconPath = _documentation[smscType] ?? 
                      _buildingCharacteristics[smscType] ?? 
                      _fireExtinguishingSystems[smscType] ?? 
                      _detectionAlarmSystems[smscType] ?? 
                      _structuralProtectionSystems[smscType] ?? 
                      _gasElectricalInstallations[smscType] ?? 
                      _specificAreas[smscType] ?? 
                      _plansAndBrigades[smscType];
    
    if (iconPath == null) {
      // Log de erro para facilitar a depuração
      developer.log('Ícone não encontrado para o tipo SMSCI: $smscType', level: 1);
      return 'icons/Documentos_especificos_dos_SMSCI.svg'; // Ícone padrão
    }
    
    // Normaliza o nome do arquivo antes de retornar
    return _normalizeFileName(iconPath);
  }
}
