import 'package:flutter_modular/flutter_modular.dart';
import 'package:graphql_igti/app/modules/home/repository/curso_repository_interface.dart';

import 'home_controller.dart';
import 'home_page.dart';
import 'repository/curso_repository.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<ICursoRepository>((i) => CursoRepository()),
        $HomeController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
