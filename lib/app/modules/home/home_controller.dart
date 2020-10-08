import 'package:flutter_modular/flutter_modular.dart';
import 'package:graphql_igti/app/modules/home/repository/curso_repository_interface.dart';
import 'package:mobx/mobx.dart';

import 'domain/curso.dart';
import 'home_module.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

  var repository = HomeModule.to.get<ICursoRepository>();

  Future<List<Curso>> recuperarCursos(){
    return repository.fetchCursos();
  }
}
