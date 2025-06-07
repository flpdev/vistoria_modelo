import '../../../domain/vistorias/entities/vistoria.dart';
import '../../../domain/vistorias/repositories/vistorias_repository.dart';
import '../dtos/vistoria_dto.dart';

/// Implementa VistoriasRepository retornando dados fixos (mock).
class VistoriasRepositoryImpl implements VistoriasRepository {
  @override
  Future<List<Vistoria>> fetchVistorias() async {
    // Simula delay de carregamento
    await Future.delayed(const Duration(milliseconds: 500));

    // Dados mock (hard-coded)
    final mockList = <VistoriaDTO>[
      VistoriaDTO(
        id: '1',
        tipo: 'Habite-se',
        endereco: 'Rua das Flores, 123',
        status: 'Em andamento',
      ),
      VistoriaDTO(
        id: '2',
        tipo: 'Funcionamento',
        endereco: 'Av. Central, 456',
        status: 'Na fila',
      ),
      VistoriaDTO(
        id: '3',
        tipo: 'Interdição',
        endereco: 'Praça da Liberdade, 789',
        status: 'Concluída',
      ),
    ];

    // Converte cada DTO para entidade
    return mockList.map((dto) => dto.toEntity()).toList();
  }
}
