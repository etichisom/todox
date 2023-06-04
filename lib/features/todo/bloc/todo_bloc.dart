import 'package:bloc/bloc.dart';
import 'package:todox/core/data/todo/todo_data.dart';
import 'package:todox/features/todo/data/repository/todo_repo_impl.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class AuthBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepositoryImpl todoRepositoryImpl;
  final TodoData? todoData;
  AuthBloc({required this.todoRepositoryImpl, required this.todoData})
      : super(InitialTodoState(todoData ?? const TodoData())) {
    on<TodoEventAdd>((event, emit) async {
      try {
        emit(LoadingTodoState(state.todoData));
        await todoRepositoryImpl.addTodo(event.todoData);
        emit(InitialTodoState(event.todoData));
      } catch (e) {
        emit(ErrorTodoState(state.todoData));
        Future.delayed(const Duration(seconds: 2), () {
          emit(InitialTodoState(event.todoData));
        });
      }
    });

    on<TodoEventEdit>((event, emit) async {
      try {
        emit(LoadingTodoState(state.todoData));
        await todoRepositoryImpl.editTodo(event.todoData);
        emit(InitialTodoState(state.todoData));
      } catch (e) {
        emit(ErrorTodoState(state.todoData));
        Future.delayed(const Duration(seconds: 2), () {
          emit(InitialTodoState(state.todoData));
        });
      }
    });
  }
}
