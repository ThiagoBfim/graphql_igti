import 'package:graphql_igti/app/modules/home/repository/curso_repository_interface.dart';
import 'repository/curso_repository.dart';
import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds =>
      [
        Bind<ICursoRepository>((i) => CursoRepository(http.Client())),
        $HomeController,
      ];

  @override
  List<ModularRouter> get routers =>
      [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
