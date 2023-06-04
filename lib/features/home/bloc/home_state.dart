part of 'home_bloc.dart';

abstract class HomeState {}

class InitialHomeState extends HomeState {}

class LoadingHomeState extends HomeState {}

class LoadedHomeState extends HomeState {
  final List<TodoData> allTodo;
  final List<TodoData> pendingTodo;
  final List<TodoData> completedTodo;
  LoadedHomeState({
    required this.allTodo,
    required this.pendingTodo,
    required this.completedTodo,
  });
}

class ErrorTodoState extends HomeState {}
