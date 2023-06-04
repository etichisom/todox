part of 'todo_bloc.dart';

abstract class TodoState {
  final TodoData todoData;
  TodoState(this.todoData);
}

class InitialTodoState extends TodoState {
  InitialTodoState(super.todoData);
}

class LoadingTodoState extends TodoState {
  LoadingTodoState(super.todoData);
}


class ErrorTodoState extends TodoState {
  ErrorTodoState(super.todoData);
}

