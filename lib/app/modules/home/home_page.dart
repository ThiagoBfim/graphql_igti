import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:graphql_igti/app/app_widget.dart';

import '../../domain/curso.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _buildAppBar(),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            AppWidget.primarySwatch[300],
            AppWidget.primarySwatch[600],
            AppWidget.primarySwatch[800],
          ],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 1.0),
          stops: [0.0, 1.0, 3.0],
          tileMode: TileMode.clamp,
        )),
        child: Column(
          children: [
            Padding(
              key: Key('_logo_icon'),
              padding: const EdgeInsets.only(top: 60.0),
              child: Image.network(
                  "https://www.igti.com.br/wp-content/themes/wp-bootstrap-4/assets/images/logos/logo-green.png"),
            ),
            Expanded(
              child: FutureBuilder<List<Curso>>(
                  future: controller.recuperarCursos(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return _buildLoading();
                    } else {
                      return _buildCursosList(snapshot);
                    }
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppWidget.primarySwatch[900],
                  boxShadow: [
                    BoxShadow(color: Colors.white12, spreadRadius: 0.5),
                  ],
                ),
                child: MaterialButton(
                  onPressed: () => Navigator.pushNamed(context, "/new-course"),
                  child: Text(
                    'Adicionar novo curso',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCursosList(AsyncSnapshot<List<Curso>> snapshot) {
    return Container(
      child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemCount: snapshot.data.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              var qtdCursosParaSeremConcludios = snapshot.data
                  .where((element) => element.getPercentConcluido() != 1)
                  .length;
              return ListTile(
                  title: Text(
                "Você possui $qtdCursosParaSeremConcludios cursos para serem concluídos.",
                style: TextStyle(fontWeight: FontWeight.bold),
              ));
            }
            var curso = snapshot.data[index - 1];
            return _buildCurstoItem(curso);
          }),
    );
  }

  ListTile _buildCurstoItem(Curso curso) {
    return ListTile(
      title: Text(curso.dsNome, style: TextStyle(color: Colors.white)),
      subtitle: Hero(
        tag: curso.dsNome + "_progress_bar",
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                height: 20,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: LinearProgressIndicator(
                    value: curso.getPercentConcluido(),
                    backgroundColor: Colors.grey.withAlpha(50),
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                (curso.getPercentConcluido() * 100).round().toString() + "%",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  Center _buildLoading() => Center(child: CircularProgressIndicator());
}
