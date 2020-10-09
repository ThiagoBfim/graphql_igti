import 'package:flutter_modular/flutter_modular.dart';
import 'package:graphql_igti/app/domain/curso.dart';

abstract class ICursoRepository extends Disposable {

  Future<List<Curso>> fetchCursos();

  Future saveCurso(Curso curso);
}
