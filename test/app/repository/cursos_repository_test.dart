import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_igti/app/domain/curso.dart';
import 'package:graphql_igti/app/repository/curso_repository.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

class MockClient extends Mock implements http.Client {}


void main() {
  CursoRepository repository;
  MockClient client;
  // make your mocks here
  setUp(() {
    client = MockClient();
    repository = CursoRepository(client: client);
  });

  group('CursoRepository Test', () {
    test("First Test", () {
      expect(repository, isInstanceOf<CursoRepository>());
    });

    test('returns a Post if the http call completes successfully', () async {
      when(client.post('https://adequate-loon-78.hasura.app/v1/graphql', body: anyNamed('body'), headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(jsonReturn, 200));
      List<Curso> data = await repository.fetchCursos();
      expect(data[0].dsNome, 'TESTE');
    });
  });
}

var jsonReturn = '''
   {
    "data": {
        "curso": [
            {
                "ds_nome": "TESTE",
                "materiasConcluidas": {
                    "aggregate": {
                        "count": 1
                    }
                },
                "totalMaterias": {
                    "aggregate": {
                        "count": 1
                    }
                }
            }
        ]
    }
}
''';