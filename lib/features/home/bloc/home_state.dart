part of 'home_bloc.dart';

abstract class HomeState {

}

class InitialHomeState extends HomeState {}

class LoadingHomeState extends HomeState {}

class LoadingLoadedState extends HomeState {
  final List<TodoData> todos;
  LoadingLoadedState(this.todos);
}


class ErrorTodoState extends HomeState {

}

