import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_igti/app/modules/home/home_controller.dart';
import 'package:graphql_igti/app/modules/home/home_module.dart';
import 'package:graphql_igti/app/modules/home/repository/curso_repository_interface.dart';
import 'package:mockito/mockito.dart';

class CursoRepositoryMock extends Mock implements ICursoRepository {}

void main() {
  initModule(HomeModule(),changeBinds: [ Bind<ICursoRepository>((i) => CursoRepositoryMock())]);
  HomeController home;
  //
  setUp(() {
        home = HomeModule.to.get<HomeController>();
  });

  group('HomeController Test', () {
      test("First Test", () {
        expect(home, isInstanceOf<HomeController>());
      });

  });
}
