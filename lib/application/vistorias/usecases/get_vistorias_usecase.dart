import '../../../domain/vistorias/entities/vistoria.dart';
import '../../../domain/vistorias/repositories/vistorias_repository.dart';

/// Caso de uso que orquestra a obtenção da lista de vistorias.
class GetVistoriasUseCase {
  final VistoriasRepository _repository;

  GetVistoriasUseCase(this._repository);

  /// Executa a obtenção das vistorias.
  Future<List<Vistoria>> execute() {
    return _repository.fetchVistorias();
  }
}
