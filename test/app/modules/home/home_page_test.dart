import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_igti/app/modules/home/home_module.dart';
import 'package:graphql_igti/app/modules/home/home_page.dart';
import 'package:image_test_utils/image_test_utils.dart';

void main() {
  initModule(HomeModule());
  testWidgets('HomePage has title', (tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(buildTestableWidget(HomePage()));
      final titleFinder = find.byKey(Key("_logo_icon"));
      expect(titleFinder, findsOneWidget);
    });
  });

}
