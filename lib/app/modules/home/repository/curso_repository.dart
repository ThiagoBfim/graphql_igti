import 'package:hasura_connect/hasura_connect.dart';

import '../domain/curso.dart';
import 'curso_repository_interface.dart';
import 'package:http/http.dart' as http;

class CursoRepository implements ICursoRepository {

  final http.Client client;
  CursoRepository(this.client);

  Future<List<Curso>> fetchCursos() async {
    String url = 'https://adequate-loon-78.hasura.app/v1/graphql';
    HasuraConnect hasuraConnect = HasuraConnect(url, httpClient: client);
    String docQuery = """
      query MyQuery {
        curso(order_by: {ds_nome: asc}) {
          ds_nome
          materias_aggregate {
            aggregate {
              count(columns: cod_materia)
            }
          }
        }
      }
    """;
    var snapshot = await hasuraConnect.query(docQuery);
    List<Curso> cursos = [];
    for(var curso in snapshot['data']['curso'] as List<dynamic>){
      cursos.add(Curso.fromJson(curso));
    }
    return cursos;
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

}


