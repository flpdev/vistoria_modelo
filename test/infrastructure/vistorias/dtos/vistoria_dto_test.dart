import 'package:flutter_test/flutter_test.dart';
import 'package:app_bombeiros_v3/domain/vistorias/entities/vistoria.dart';
import 'package:app_bombeiros_v3/infrastructure/vistorias/dtos/vistoria_dto.dart';

/// Testes unitários para o VistoriaDTO
void main() {
  group('VistoriaDTO', () {
    test('should create a VistoriaDTO instance with correct properties', () {
      // Arrange & Act
      final dto = VistoriaDTO(
        id: '123',
        type: 'Habite-se',
        address: 'Rua das Flores, 123',
        status: 'Em andamento',
      );

      // Assert
      expect(dto.id, '123');
      expect(dto.type, 'Habite-se');
      expect(dto.address, 'Rua das Flores, 123');
      expect(dto.status, 'Em andamento');
    });

    test('toEntity should convert DTO to domain entity correctly', () {
      // Arrange
      final dto = VistoriaDTO(
        id: '123',
        type: 'Habite-se',
        address: 'Rua das Flores, 123',
        status: 'Em andamento',
      );

      // Act
      final entity = dto.toEntity();

      // Assert
      expect(entity, isA<Vistoria>());
      expect(entity.id, dto.id);
      expect(entity.type, dto.type);
      expect(entity.address, dto.address);
      expect(entity.status, dto.status);
    });
  });
}
