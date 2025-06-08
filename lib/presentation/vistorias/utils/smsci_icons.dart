/// Classe utilitária para mapear os nomes dos ícones SMSCI para os arquivos SVG
class SMSCIIcons {
  /// Retorna o caminho do arquivo SVG para o tipo de SMSCI especificado
  static String getIconPath(String tipoSMSCI) {
    // Mapeamento corrigido para garantir que os ícones sejam encontrados
    final Map<String, String> iconesPorTipo = {
      'Documentos específicos dos SMSCI': 'icons/Documentos_especificos_dos_SMSCI.svg', 
      'Características gerais do Bloco': 'icons/caracteristicas_gerais_do_bloco.svg', 
      'Comercialização de Gás combustível e armazenamento de recipiente': 'icons/comercializacao_gas.svg',
      'Piscinas e áreas recreativas com opção aquática de lazer': 'icons/piscinas_e_areas_recreativas.svg',
      'Estufa de secagem e silos': 'icons/estufa_de_secagem_e_silos.svg',
      'Preventivo por extintores': 'icons/preventivo_por_extintores.svg',
      'Hidráulico preventivo': 'icons/hidraulico_preventivo.svg',
      'Detecção e Alarme de Incêndio': 'icons/deteccao_e_Alarme_de_Incendio.svg',
      'Iluminação de Emergência': 'icons/Iluminacao_de_Emergencia.svg',
      'Sinalização para abandono de local': 'icons/Sinalizacao_para_Abandono_de_Local.svg',
      'Chuveiros automáticos (Sprinklers)': 'icons/chuveiros_automaticos.svg',
      'Proteção contra descargas atmosféricas (SPDA)': 'icons/protecao_contra_descargas_atmosfericas.svg',
      'Controle de fumaça': 'icons/Controle_de_Fumaca.svg',
      'Fixo de gases limpos e dióxido de carbono': 'icons/Fixo_de_gases_limpos_e_dioxido_de_carbono.svg',
      'Água nebulizada': 'icons/agua_nebulizada.svg',
      'Controle de materiais de acabamento e revestimento': 'icons/controle_de_materiais_de_acabamento_e_revestimento.svg',
      'Saídas de emergência': 'icons/Saidas_de_Emergencia.svg',
      'Acesso de viaturas': 'icons/Acesso_de_viaturas.svg',
      'Compartimentação horizontal e vertical': 'icons/Compartimentacao_Horizontal_e_Vertical.svg',
      'Instalações de gás combustível': 'icons/Instalacoes_de_gas_combustivel.svg',
      'Instalações elétricas de baixa tensão': 'icons/Instalacoes_eletricas_de_baixa_tensao.svg',
      'Parque para armazenamentos de líquidos inflamáveis e combustíveis': 'icons/parque_para_armazenamentos_de_liquidos_inflamaveis_e_combustiveis.svg',
      'Rede pública de hidrantes': 'icons/rede_publica_de_hidrantes.svg',
      'Pátio de contêineres': 'icons/patio_de_conteineres.svg',
      'Locais onde a liberdade das pessoas sofre restrições': 'icons/Locais_onde_a_liberdade_das_pessoas_sofre_restricoes.svg',
      'Fogos de artifícios, explosivos e munições': 'icons/Fogos_de_artificios_explosivos_e_municoes.svg',
      'Brigada de Incêndio': 'icons/brigada_de_incendio.svg',
      'Plano de emergência': 'icons/plano_de_emergencia.svg',
    };

    return iconesPorTipo[tipoSMSCI] ?? 'icons/Documentos_especificos_dos_SMSCI.svg';
  }
}
