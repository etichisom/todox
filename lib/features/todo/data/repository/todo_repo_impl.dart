import 'dart:async';
import 'package:todox/core/data/todo/todo_data.dart';
import 'package:todox/core/exceptions/app_excpetion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todox/features/todo/domain/repository/add_todo_repo.dart';

class TodoRepositoryImpl extends TodoRepository {
  CollectionReference todoReference =
      FirebaseFirestore.instance.collection('todo');

  @override
  Future<bool> addTodo(TodoData todoData) async {
    try {
      await todoReference
          .doc(todoData.id ?? DateTime.now().millisecondsSinceEpoch.toString())
          .set(todoData.toJson())
          .timeout(const Duration(seconds: 5));
      return true;
    } catch (e) {
      throw ServerError('Something went wrong');
    }
  }

  @override
  Future<bool> editTodo(TodoData todoData) async {
    try {
      await todoReference
          .doc(todoData.id ?? DateTime.now().millisecondsSinceEpoch.toString())
          .update(todoData.toJson())
          .timeout(const Duration(seconds: 5));
      return true;
    } catch (e) {
      throw ServerError('Something went wrong');
    }
  }

  @override
  Stream<List<TodoData>> getTodo(String uid) {
    try {
      StreamSubscription? listener;
      StreamController<List<TodoData>> todo = StreamController(onCancel: () {
        if (listener != null) {
          listener.cancel();
        }
      });
      listener = todoReference
          .where('uid', isEqualTo: uid)
          .snapshots()
          .listen((event) {
        List<TodoData> todoList = [];
        for (var e in event.docs) {
          todoList.add(TodoData.fromJson(e.data() as Map<String, dynamic>));
        }
        todo.add(todoList);
      });

      return todo.stream;
    } catch (e) {
      throw ServerError('Something went wrong');
    }
  }
}
