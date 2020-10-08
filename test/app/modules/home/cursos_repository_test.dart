import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_igti/app/modules/home/domain/curso.dart';
import 'package:graphql_igti/app/modules/home/repository/curso_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

class MockClient extends Mock implements http.Client {}


void main() {
  CursoRepository repository;
  MockClient client;
  // make your mocks here
  setUp(() {
    client = MockClient();
    repository = CursoRepository(client);
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
                "materias_aggregate": {
                    "aggregate": {
                        "count": 0
                    }
                }
            },
            {
                "ds_nome": "Fundamentos em Desenvolvimento Mobile",
                "materias_aggregate": {
                    "aggregate": {
                        "count": 2
                    }
                }
            }
        ]
    }
}
''';