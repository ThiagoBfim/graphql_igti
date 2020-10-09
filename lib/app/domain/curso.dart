class Curso {
  String dsNome;
  int totalMaterias;
  int materiasConcluidas;

  Curso(this.dsNome);

  Curso.fromJson(Map<String, dynamic> json) {
    this.dsNome = json['ds_nome'];
    this.materiasConcluidas = json['materiasConcluidas']['aggregate']['count'];
    this.totalMaterias = json['totalMaterias']['aggregate']['count'];
  }
}
