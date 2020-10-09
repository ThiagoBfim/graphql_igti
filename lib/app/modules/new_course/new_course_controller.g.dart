// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_course_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $NewCourseController = BindInject(
  (i) => NewCourseController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewCourseController on _NewCourseControllerBase, Store {
  final _$nomeCursoAtom = Atom(name: '_NewCourseControllerBase.nomeCurso');

  @override
  String get nomeCurso {
    _$nomeCursoAtom.reportRead();
    return super.nomeCurso;
  }

  @override
  set nomeCurso(String value) {
    _$nomeCursoAtom.reportWrite(value, super.nomeCurso, () {
      super.nomeCurso = value;
    });
  }

  final _$_NewCourseControllerBaseActionController =
      ActionController(name: '_NewCourseControllerBase');

  @override
  void atualizarNome(String nomeCurso) {
    final _$actionInfo = _$_NewCourseControllerBaseActionController.startAction(
        name: '_NewCourseControllerBase.atualizarNome');
    try {
      return super.atualizarNome(nomeCurso);
    } finally {
      _$_NewCourseControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nomeCurso: ${nomeCurso}
    ''';
  }
}
