import 'package:flutter_test/flutter_test.dart';
import 'package:app_bombeiros_v3/domain/vistorias/entities/vistoria.dart';
import 'package:app_bombeiros_v3/infrastructure/vistorias/repositories/vistorias_repository_impl.dart';

/// Testes unitários para o VistoriasRepositoryImpl
void main() {
  late VistoriasRepositoryImpl repository;

  setUp(() {
    repository = VistoriasRepositoryImpl();
  });

  group('VistoriasRepositoryImpl', () {
    test('fetchVistorias should return a list of Vistoria entities', () async {
      // Act
      final result = await repository.fetchVistorias();

      // Assert
      expect(result, isA<List<Vistoria>>());
      expect(result.length, 3); // Verificando se retorna os 3 itens mock
      
      // Verificando o primeiro item
      expect(result[0].id, '1');
      expect(result[0].type, 'Habite-se');
      expect(result[0].address, 'Rua das Flores, 123');
      expect(result[0].status, 'Em andamento');
    });
  });
}
