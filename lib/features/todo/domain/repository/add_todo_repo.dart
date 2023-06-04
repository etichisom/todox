import 'dart:async';

import 'package:todox/core/data/todo/todo_data.dart';

abstract class TodoRepository {
  Future<bool> addTodo(TodoData todoData);
  Future<bool> editTodo(TodoData todoData);
  Stream<List<TodoData>> getTodo();
}
