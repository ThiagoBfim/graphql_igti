import 'package:flutter_modular/flutter_modular.dart';
import 'package:graphql_igti/app/modules/home/domain/curso.dart';

abstract class ICursoRepository extends Disposable {

  Future<List<Curso>> fetchCursos();

}
