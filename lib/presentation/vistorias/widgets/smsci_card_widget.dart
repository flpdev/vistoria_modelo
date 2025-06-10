import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/smsci_icons.dart';
import '../utils/app_styles.dart';

/// Widget de Card para exibição dos itens de SMSCI
/// 
/// Componente reutilizável que exibe um card com ícone e título
/// para os Sistemas e Medidas de Segurança Contra Incêndio e Pânico
class SMSCICardWidget extends StatelessWidget {
  /// Título do SMSCI
  final String titulo;
  
  /// Função de callback para quando o card for pressionado
  final VoidCallback onTap;

  /// Construtor do widget
  const SMSCICardWidget({
    super.key,
    required this.titulo,
    required this.onTap,
  });

  /// Constrói o widget de ícone com tratamento de erro
  Widget _buildIconWidget(String titulo) {
    try {
      final String iconPath = SMSCIIcons.getIconPath(titulo);
      
      return SvgPicture.asset(
        iconPath,
        colorFilter: const ColorFilter.mode(AppStyles.primaryOrange, BlendMode.srcIn),
        fit: BoxFit.contain,
        placeholderBuilder: (BuildContext context) => _buildFallbackIcon(),
        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
          // Registra o erro para facilitar a depuração
          developer.log('Erro ao carregar ícone SVG: $iconPath', error: exception, stackTrace: stackTrace);
          return _buildFallbackIcon();
        },
      );
    } catch (e) {
      // Em caso de erro, exibe um ícone de fallback e registra o erro
      developer.log('Erro ao processar ícone para o SMSCI: $titulo', error: e);
      return _buildFallbackIcon();
    }
  }

  /// Constrói um ícone de fallback para quando o SVG não puder ser carregado
  Widget _buildFallbackIcon() {
    return Container(
      width: AppStyles.cardIconWidth,
      height: AppStyles.cardIconHeight,
      color: AppStyles.lightGray,
      child: const Icon(
        Icons.folder,
        color: AppStyles.primaryOrange,
        size: AppStyles.iconSizeMedium,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppStyles.borderRadiusMedium),
      child: Container(
        width: AppStyles.cardWidth,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        decoration: ShapeDecoration(
          color: AppStyles.lightGray,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppStyles.borderRadiusMedium)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: AppStyles.cardIconWidth,
              height: AppStyles.cardIconHeight,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(),
              child: _buildIconWidget(titulo),
            ),
            SizedBox(height: AppStyles.spacingXSmall),
            SizedBox(
              width: AppStyles.cardTextWidth,
              height: AppStyles.cardTextHeight,
              child: Text(
                titulo,
                textAlign: TextAlign.center,
                maxLines: AppStyles.cardTextMaxLines.toInt(),
                overflow: TextOverflow.ellipsis,
                style: AppStyles.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
