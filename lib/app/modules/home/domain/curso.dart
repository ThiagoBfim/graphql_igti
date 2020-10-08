class Curso {
  String dsNome;
  int totalMaterias;

  Curso.fromJson(Map<String, dynamic> json) {
    this.dsNome = json['ds_nome'];
    this.totalMaterias = json['materias_aggregate']['aggregate']['count'];
  }
}