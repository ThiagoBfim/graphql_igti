import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/native_imp.dart';
import 'package:hasura_connect/hasura_connect.dart';


abstract class ICursoRepository extends Disposable {
  final Dio client;

  ICursoRepository(this.client);

  Future<List<Curso>> fetchPost() async {
    String url = 'https://adequate-loon-78.hasura.app/v1/graphql';
    HasuraConnect hasuraConnect = HasuraConnect(url);
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

  //dispose will be called automatically
  @override
  void dispose() {}
}

class Curso {
  String dsNome;
  int totalMaterias;

  Curso.fromJson(Map<String, dynamic> json) {
    this.dsNome = json['ds_nome'];
    this.totalMaterias = json['materias_aggregate']['aggregate']['count'];
  }
}
