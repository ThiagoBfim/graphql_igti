import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'new_course_controller.dart';

class NewCoursePage extends StatefulWidget {
  @override
  _NewCoursePageState createState() => _NewCoursePageState();
}

class _NewCoursePageState
    extends ModularState<NewCoursePage, NewCourseController> {
  //use 'controller' variable to access controller
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Observer(builder: (_) => Text('${controller.nomeCurso ?? ''}')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Observer(
              builder: (_) => Form(
                key: _formKey,
                child: TextFormField(
                    onChanged: controller.atualizarNome,
                    validator: controller.validarNome,
                    decoration: InputDecoration(
                        errorText: controller.mensagemErroValidor(),
                        hintText: 'Nome do Curso',
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ))),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onSave,
        child: Icon(Icons.save),
      ),
    );
  }

  void onSave() {
    return _formKey.currentState.validate() ? saveAndGoBackHome() : null;
  }

  saveAndGoBackHome() {
    showAlertDialog(context);
    controller.saveCurso().then((value) =>
        Navigator.of(context).pushNamedAndRemoveUntil("/", (route) => false));
  }

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 5), child: Text("Loading")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
