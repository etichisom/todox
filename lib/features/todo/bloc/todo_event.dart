part of 'todo_bloc.dart';

abstract class TodoEvent {}

class SaveEventAdd extends TodoEvent {
  SaveEventAdd();
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
  final DateTime? pickedDate;
  AddDateTodoEvent(this.pickedDate);
}

class AddTimeTodoEvent extends TodoEvent {
  AddTimeTodoEvent();
}
