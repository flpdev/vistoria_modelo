import 'package:flutter/material.dart';

/// Classe utilitária para armazenar estilos e temas da aplicação
class AppStyles {
  // Cores
  static const Color primaryOrange = Color(0xFFE66F0E);
  static const Color darkGray = Color(0xFF333333);
  static const Color mediumGray = Color(0xFF767676);
  static const Color lightGray = Color(0xFFF3F3F3);
  static const Color successGreen = Color(0xFF168821);

  // Espaçamentos
  static const double spacingSmall = 8.0;
  static const double spacingMedium = 16.0;
  static const double spacingLarge = 24.0;
  static const double spacingExtraLarge = 40.0;

  // Estilos de texto
  static const TextStyle titleLarge = TextStyle(
    color: darkGray,
    fontSize: 18,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle titleMedium = TextStyle(
    color: darkGray,
    fontSize: 16,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w600,
    height: 1.25,
  );

  static const TextStyle bodyLarge = TextStyle(
    color: darkGray,
    fontSize: 16,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bodyMedium = TextStyle(
    color: darkGray,
    fontSize: 14,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    height: 1.43,
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
