part of 'todo_bloc.dart';

abstract class TodoEvent {}

class TodoEventAdd extends TodoEvent {
  TodoEventAdd();
}

class TodoEventEdit extends TodoEvent {
  TodoEventEdit();
}

class AddTitleTodoEvent extends TodoEvent {
  final String title;
  AddTitleTodoEvent(this.title);
}

class AddNoteTodoEvent extends TodoEvent {
  final String note;
  AddNoteTodoEvent(this.note);
}

class AddDateTodoEvent extends TodoEvent {
  AddDateTodoEvent();
}

class AddTimeTodoEvent extends TodoEvent {
  AddTimeTodoEvent();
}
