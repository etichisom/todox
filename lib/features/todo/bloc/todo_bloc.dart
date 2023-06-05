import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todox/core/data/todo/todo_data.dart';
import 'package:todox/features/todo/data/repository/todo_repo_impl.dart';
import 'package:todox/features/todo/page/add_task.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepositoryImpl todoRepositoryImpl;

  final TodoData? todoData;
  final AddTodoType addTodoType;
  TodoBloc({
    required this.todoRepositoryImpl,
    this.todoData,
    required this.addTodoType,
  }) : super(InitialTodoState(todoData ?? const TodoData())) {
    on<SaveEventAdd>((event, emit) async {
      try {
        emit(LoadingTodoState(state.todoData));
        if (addTodoType == AddTodoType.edit) {
          await todoRepositoryImpl.editTodo(state.todoData);
        } else {
          await todoRepositoryImpl.addTodo(state.todoData.copyWith(
            uid: FirebaseAuth.instance.currentUser?.uid??"",
            id: DateTime.now().millisecondsSinceEpoch.toString(),
          ));
        }
        emit(SuccessTodoState(state.todoData));
      } catch (e) {
        emit(ErrorTodoState(state.todoData));
        Future.delayed(const Duration(seconds: 2), () {
          emit(InitialTodoState(state.todoData));
        });
      }
    });

    on<AddDateTodoEvent>((event, emit) {
      if (event.pickedDate != null) {
        emit(
          InitialTodoState(
            state.todoData.copyWith(
              date: event.pickedDate.toString(),
            ),
          ),
        );
      }
    });

    on<AddTitleTodoEvent>((event, emit) {
      emit(
        InitialTodoState(
          state.todoData.copyWith(
            title: event.title,
          ),
        ),
      );

    });

    on<AddNoteTodoEvent>((event, emit) {
      emit(
        InitialTodoState(
          state.todoData.copyWith(
            note: event.note,
          ),
        ),
      );
    });
  }
}
