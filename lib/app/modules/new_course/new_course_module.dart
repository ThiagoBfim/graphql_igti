import 'package:graphql_igti/app/modules/new_course/new_course_page.dart';

import 'new_course_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NewCourseModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $NewCourseController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => NewCoursePage()),
      ];

  static Inject get to => Inject<NewCourseModule>.of();
}
