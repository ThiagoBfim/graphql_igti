import 'package:graphql_igti/app/repository/curso_repository.dart';
import 'package:graphql_igti/app/repository/curso_repository_interface.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:graphql_igti/app/app_widget.dart';
import 'package:graphql_igti/app/modules/home/home_module.dart';

import 'modules/new_course/new_course_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind<ICursoRepository>((i) => CursoRepository()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: HomeModule()),
        ModularRouter('/new-course', module: NewCourseModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
