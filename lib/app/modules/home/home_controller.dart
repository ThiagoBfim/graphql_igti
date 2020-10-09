import 'package:flutter_modular/flutter_modular.dart';
import 'package:graphql_igti/app/repository/curso_repository_interface.dart';
import 'package:mobx/mobx.dart';

import '../../app_module.dart';
import '../../domain/curso.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  var repository = AppModule.to.get<ICursoRepository>();

  Future<List<Curso>> recuperarCursos() {
    return repository.fetchCursos();
  }
}
