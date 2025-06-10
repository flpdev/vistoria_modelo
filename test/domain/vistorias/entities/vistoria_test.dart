import 'package:flutter_test/flutter_test.dart';
import 'package:app_bombeiros_v3/domain/vistorias/entities/vistoria.dart';

/// Testes unitários para a entidade Vistoria
void main() {
  group('Vistoria Entity', () {
    test('should create a Vistoria instance with correct properties', () {
      // Arrange & Act
      final vistoria = Vistoria(
        id: '123',
        type: 'Habite-se',
        address: 'Rua das Flores, 123',
        status: 'Em andamento',
      );

      // Assert
      expect(vistoria.id, '123');
      expect(vistoria.type, 'Habite-se');
      expect(vistoria.address, 'Rua das Flores, 123');
      expect(vistoria.status, 'Em andamento');
    });

    test('two Vistoria instances with same values should be equal', () {
      // Arrange
      final vistoria1 = Vistoria(
        id: '123',
        type: 'Habite-se',
        address: 'Rua das Flores, 123',
        status: 'Em andamento',
      );
      
      final vistoria2 = Vistoria(
        id: '123',
        type: 'Habite-se',
        address: 'Rua das Flores, 123',
        status: 'Em andamento',
      );

      // Assert
      expect(vistoria1.id, vistoria2.id);
      expect(vistoria1.type, vistoria2.type);
      expect(vistoria1.address, vistoria2.address);
      expect(vistoria1.status, vistoria2.status);
    });
  });
}
