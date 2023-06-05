part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  final TodoData todoData;
  const TodoState(this.todoData);

  bool get todoValid {
    if ((todoData.note ?? "").isNotEmpty &&
        (todoData.title ?? "").isNotEmpty &&
        (todoData.date ?? "").isNotEmpty) {
      return true;
    }
    return false;
  }
}

class InitialTodoState extends TodoState {
  const InitialTodoState(super.todoData);

  @override
  List<Object?> get props => [todoData];
}

class LoadingTodoState extends TodoState {
  const LoadingTodoState(super.todoData);
  @override
  List<Object?> get props => [todoData];
}

class SuccessTodoState extends TodoState {
  const SuccessTodoState(super.todoData);
  @override
  List<Object?> get props => [todoData];
}

class ErrorTodoState extends TodoState {
  const ErrorTodoState(super.todoData);
  @override
  List<Object?> get props => [todoData];
}
