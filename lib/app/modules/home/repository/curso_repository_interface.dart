import 'package:flutter_modular/flutter_modular.dart';
import 'package:graphql_igti/app/modules/home/domain/curso.dart';
import 'package:http/http.dart' as http;

abstract class ICursoRepository extends Disposable {
  final http.Client client;

  ICursoRepository(this.client);

  Future<List<Curso>> fetchCursos();

}
