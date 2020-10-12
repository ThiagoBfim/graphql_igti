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

  double getPercentConcluido() {
    if (totalMaterias == 0) {
      return 0.0;
    } else {
      return (materiasConcluidas / totalMaterias).toDouble();
    }
  }
}
