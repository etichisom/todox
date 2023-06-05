part of 'home_bloc.dart';


abstract class HomeEvent{}

class LoadTodoHomeEvent extends HomeEvent{
 final  List<TodoData> todo;
  LoadTodoHomeEvent(this.todo);
}

class LoadTodoRequestEvent extends HomeEvent{
  LoadTodoRequestEvent();
}

class EditTodoHomeEvent extends HomeEvent{
  final TodoData todoData;
  final bool status;
  EditTodoHomeEvent({required this.todoData, required this.status});
}

class LogoutHomeEvent extends HomeEvent{
  LogoutHomeEvent();
}