import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/vistorias/usecases/get_vistorias_usecase.dart';
import '../../../infrastructure/vistorias/repositories/vistorias_repository_impl.dart';
import '../../../domain/vistorias/entities/vistoria.dart';
import '../../../domain/vistorias/repositories/vistorias_repository.dart';

// 1) Provider para o repositório (injeção de dependência)
final vistoriasRepositoryProvider = Provider<VistoriasRepository>((ref) {
  return VistoriasRepositoryImpl();
});

// 2) Provider para o use case
final getVistoriasUseCaseProvider = Provider<GetVistoriasUseCase>((ref) {
  final repo = ref.watch(vistoriasRepositoryProvider);
  return GetVistoriasUseCase(repo);
});

// 3) Estados possíveis para a tela de vistorias
enum VistoriasState { initial, loading, loaded, error }

// 4) ViewModel para encapsular os dados e estado da tela
class VistoriasViewModel {
  final VistoriasState state;
  final List<Vistoria> vistorias;
  final String? errorMessage;

  const VistoriasViewModel({
    required this.state,
    required this.vistorias,
    this.errorMessage,
  });

  // Fábrica do estado inicial
  factory VistoriasViewModel.initial() {
    return const VistoriasViewModel(
      state: VistoriasState.initial,
      vistorias: [],
      errorMessage: null,
    );
  }

  // Copiar o estado com novos valores
  VistoriasViewModel copyWith({
    VistoriasState? state,
    List<Vistoria>? vistorias,
    String? errorMessage,
  }) {
    return VistoriasViewModel(
      state: state ?? this.state,
      vistorias: vistorias ?? this.vistorias,
      errorMessage: errorMessage,
    );
  }
}

// 5) StateNotifier que manipulaper and emits novos estados
class VistoriasNotifier extends StateNotifier<VistoriasViewModel> {
  final GetVistoriasUseCase _getVistoriasUseCase;

  VistoriasNotifier(this._getVistoriasUseCase)
    : super(VistoriasViewModel.initial()) {
    _loadVistorias();
  }

  Future<void> _loadVistorias() async {
    state = state.copyWith(state: VistoriasState.loading);
    try {
      final list = await _getVistoriasUseCase.execute();
      state = state.copyWith(state: VistoriasState.loaded, vistorias: list);
    } catch (e) {
      state = state.copyWith(
        state: VistoriasState.error,
        errorMessage: e.toString(),
      );
    }
  }
}

// 6) StateNotifierProvider para expor o ViewModel à UI
final vistoriasProvider =
    StateNotifierProvider<VistoriasNotifier, VistoriasViewModel>((ref) {
      final useCase = ref.watch(getVistoriasUseCaseProvider);
      return VistoriasNotifier(useCase);
    });
