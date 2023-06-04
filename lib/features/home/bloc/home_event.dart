part of 'home_bloc.dart';


abstract class HomeEvent{}

class LoadTodoHomeEvent extends HomeEvent{
 final  List<TodoData> todo;
  LoadTodoHomeEvent(this.todo);
}

class LoadTodoRequestEvent extends HomeEvent{
  LoadTodoRequestEvent();
}

class TodoEventEdit extends HomeEvent{
  final TodoData todoData;
  TodoEventEdit(this.todoData);
}