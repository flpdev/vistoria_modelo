import '../entities/vistoria.dart';

abstract class VistoriasRepository {
  Future<List<Vistoria>> fetchVistorias();
}
