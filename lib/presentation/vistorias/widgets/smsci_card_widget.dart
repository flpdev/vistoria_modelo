import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/smsci_icons.dart';

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
      return SvgPicture.asset(
        SMSCIIcons.getIconPath(titulo),
        colorFilter: const ColorFilter.mode(Color(0xFFE66F0E), BlendMode.srcIn),
        fit: BoxFit.contain,
        placeholderBuilder: (BuildContext context) => _buildFallbackIcon(),
      );
    } catch (e) {
      // Em caso de erro, exibe um ícone de fallback
      return _buildFallbackIcon();
    }
  }

  /// Constrói um ícone de fallback para quando o SVG não puder ser carregado
  Widget _buildFallbackIcon() {
    return Container(
      width: 48,
      height: 48,
      color: const Color(0xFFF3F3F3),
      child: const Icon(
        Icons.folder,
        color: Color(0xFFE66F0E),
        size: 32,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 204.33,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        decoration: ShapeDecoration(
          color: const Color(0xFFF3F3F3), // Neutras-neutral-light-gray
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 56,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(),
                    child: _buildIconWidget(titulo),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            SizedBox(
              width: 184.33,
              height: 60,
              child: Text(
                titulo,
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xFF333333), // Neutras-neutral-dark-gray
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  height: 1.43,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
