import 'package:app_bombeiros_v3/domain/vistorias/entities/vistoria.dart';

/// DTO que converte de “mapa” ou JSON para a entidade de domínio.
class VistoriaDTO {
  final String id;
  final String tipo;
  final String endereco;
  final String status;

  VistoriaDTO({
    required this.id,
    required this.tipo,
    required this.endereco,
    required this.status,
  });

  /// Converte este DTO para a entidade de domínio.
  Vistoria toEntity() {
    return Vistoria(id: id, tipo: tipo, endereco: endereco, status: status);
  }

  /// Se futuramente formos ler JSON/Map, podemos criar factory:
  // factory VistoriaDTO.fromJson(Map<String, dynamic> json) => VistoriaDTO(
  //   id: json['id'],
  //   tipo: json['tipo'],
  //   endereco: json['endereco'],
  //   status: json['status'],
  // );
}
