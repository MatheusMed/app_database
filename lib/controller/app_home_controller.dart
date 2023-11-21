import 'dart:developer';

import 'package:app_teste_floor/core/database_impl.dart';
import 'package:app_teste_floor/model/tarefa_model.dart';
import 'package:flutter/material.dart';

class AppHomeController {
  final DatabaseImpl _databaseImpl;

  AppHomeController(this._databaseImpl);

  final listaTarefa = ValueNotifier<List<TarefaModel>>([]);

  final tituloC = TextEditingController();
  final descrC = TextEditingController();

  getAll() async {
    listaTarefa.value = await _databaseImpl.getAll();

    log(listaTarefa.value.toString());
  }

  insert(TarefaModel tarefaModel) async {
    await _databaseImpl.save(tarefaModel);
  }

  delete(int id) async {
    await _databaseImpl.delete(id);
  }
}
