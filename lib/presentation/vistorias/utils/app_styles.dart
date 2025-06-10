import 'package:flutter/material.dart';

/// Classe de estilos da aplicação
/// 
/// Contém constantes para cores, espaçamentos, dimensões e estilos de texto
/// para garantir consistência visual em toda a aplicação.
class AppStyles {
  // Cores
  static const Color primaryOrange = Color(0xFFE66F0E);
  static const Color lightGray = Color(0xFFF3F3F3);
  static const Color darkGray = Color(0xFF333333);
  static const Color mediumGray = Color(0xFF767676);
  static const Color successGreen = Color(0xFF4CAF50);
  static const Color errorRed = Color(0xFFE53935);
  static const Color warningYellow = Color(0xFFFFC107);

  // Espaçamentos
  static const double spacingXSmall = 4.0; // 0.25rem
  static const double spacingSmall = 8.0; // 0.5rem
  static const double spacingMedium = 16.0; // 1rem
  static const double spacingLarge = 24.0; // 1.5rem
  static const double spacingExtraLarge = 40.0; // 2.5rem

  // Bordas arredondadas
  static const double borderRadiusSmall = 4.0;
  static const double borderRadiusMedium = 8.0;
  static const double borderRadiusLarge = 16.0;
  static const double borderRadiusCircular = 100.0;

  // Dimensões de componentes
  static const double iconSizeSmall = 24.0;
  static const double iconSizeMedium = 32.0;
  static const double iconSizeLarge = 48.0;
  
  // Largura máxima do conteúdo (41.3125rem)
  static const double contentMaxWidth = 661.0;
  
  static const double cardWidth = 204.33;
  static const double cardIconWidth = 48.0;
  static const double cardIconHeight = 48.0;
  static const double cardTextWidth = 184.33;
  static const double cardTextHeight = 60.0;
  static const double cardTextMaxLines = 3;
  
  static const double headerHeight = 64.0; // 4rem
  
  // Estilos de texto
  static const TextStyle bodyMedium = TextStyle(
    color: darkGray,
    fontSize: 14,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    height: 1.43, // 20px line height / 14px font size
  );
  
  static const TextStyle bodyLarge = TextStyle(
    color: darkGray,
    fontSize: 16,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
  );
  
  static const TextStyle titleMedium = TextStyle(
    color: darkGray,
    fontSize: 16,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w600,
    height: 1.25,
  );
  
  static const TextStyle titleLarge = TextStyle(
    color: darkGray,
    fontSize: 18,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle tabSelected = TextStyle(
    color: primaryOrange,
    fontSize: 18,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle tabUnselected = TextStyle(
    color: mediumGray,
    fontSize: 18,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static const TextStyle buttonText = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w600,
  );

  // Decorações
  static BoxDecoration cardDecoration = BoxDecoration(
    color: lightGray,
    borderRadius: BorderRadius.circular(8),
  );
}
