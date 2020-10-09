import 'package:graphql_igti/app/domain/curso.dart';
import 'package:graphql_igti/app/repository/curso_repository_interface.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../app_module.dart';

part 'new_course_controller.g.dart';

@Injectable()
class NewCourseController = _NewCourseControllerBase with _$NewCourseController;

abstract class _NewCourseControllerBase with Store {
  var repository = AppModule.to.get<ICursoRepository>();

  @observable
  String nomeCurso;

  @action
  void atualizarNome(String nomeCurso) {
    this.nomeCurso = nomeCurso;
  }

  String validarNome(String nome) {
    if (nome == null || nome.length <= 3) {
      return "Nome do curso inválido";
    }
  }

  String mensagemErroValidor() {
    if (nomeCurso == null || nomeCurso.length <= 3) {
      return "Nome do curso inválido";
    }
  }

  Future saveCurso() {
    return repository.saveCurso(Curso(nomeCurso));
  }
}
