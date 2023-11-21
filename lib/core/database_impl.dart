import 'package:app_teste_floor/core/app_database.dart';
import 'package:app_teste_floor/model/tarefa_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class IDatabase<T> {
  Future<List<TarefaModel>> getAll();
  save(TarefaModel model);
  delete(int id);
}

class DatabaseImpl implements IDatabase {
  @override
  save(TarefaModel model) async {
    final Database database = await AppDatabase.instace.database;
    return await database.insert(
      'tarefa',
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  delete(int id) async {
    final Database database = await AppDatabase.instace.database;

    return database.delete(
      'tarefa',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<List<TarefaModel>> getAll() async {
    final Database database = await AppDatabase.instace.database;

    final lista = await database.query('tarefa', orderBy: 'id');

    return lista.map((e) => TarefaModel.fromMap(e)).toList();
  }
}
