import 'package:graphql_igti/app/domain/curso.dart';
import 'package:graphql_igti/app/repository/curso_repository_interface.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:http/http.dart' as http;

class CursoRepository implements ICursoRepository {
  final http.Client client;

  CursoRepository({this.client});

  Future<List<Curso>> fetchCursos() async {
    String url = 'https://adequate-loon-78.hasura.app/v1/graphql';
    HasuraConnect hasuraConnect = HasuraConnect(url, httpClient: client);
    String docQuery = """
    query MyQuery {
      curso(order_by: {ds_nome: asc}) {
        ds_nome
        materiasConcluidas: materias_aggregate(where: {st_realizada: {_eq: true}}) {
          aggregate {
            count(columns: cod_materia)
          }
        }
        totalMaterias: materias_aggregate {
          aggregate {
            count(columns: cod_materia)
          }
        }
      }
    }
    """;
    var snapshot = await hasuraConnect.query(docQuery);
    List<Curso> cursos = [];
    for (var curso in snapshot['data']['curso'] as List<dynamic>) {
      cursos.add(Curso.fromJson(curso));
    }
    return cursos;
  }

  Future saveCurso(Curso curso) {
    String url = 'https://adequate-loon-78.hasura.app/v1/graphql';
    HasuraConnect hasuraConnect = HasuraConnect(url, httpClient: client);
    String docQuery = """
    mutation MyMutation {
      insert_curso_one(
        object: {
        ds_nome: "${curso.dsNome}"
      }
      ) {
        ds_nome
      }
    }

    """;
    return hasuraConnect.mutation(docQuery);
  }

  @override
  void dispose() {}
}
