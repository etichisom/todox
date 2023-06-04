part of 'todo_bloc.dart';


abstract class TodoEvent{}

class TodoEventAdd extends TodoEvent{
  final TodoData todoData;
  TodoEventAdd(this.todoData);
}

class TodoEventEdit extends TodoEvent{
  final TodoData todoData;
  TodoEventEdit(this.todoData);
}