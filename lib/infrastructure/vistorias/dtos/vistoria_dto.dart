import 'package:app_bombeiros_v3/domain/vistorias/entities/vistoria.dart';

/// DTO que converte de “mapa” ou JSON para a entidade de domínio.
class VistoriaDTO {
  final String id;
  final String type;
  final String address;
  final String status;

  VistoriaDTO({
    required this.id,
    required this.type,
    required this.address,
    required this.status,
  });

  /// Converte este DTO para a entidade de domínio.
  Vistoria toEntity() {
    return Vistoria(id: id, type: type, address: address, status: status);
  }

  /// Se futuramente formos ler JSON/Map, podemos criar factory:
  // factory VistoriaDTO.fromJson(Map<String, dynamic> json) => VistoriaDTO(
  //   id: json['id'],
  //   type: json['type'],
  //   address: json['address'],
  //   status: json['status'],
  // );
}
