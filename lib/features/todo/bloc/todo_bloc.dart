import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todox/core/data/todo/todo_data.dart';
import 'package:todox/features/todo/data/repository/todo_repo_impl.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepositoryImpl todoRepositoryImpl;
  final BuildContext context;
  final TodoData? todoData;
  TodoBloc(
      {required this.todoRepositoryImpl,
      required this.todoData,
      required this.context})
      : super(InitialTodoState(todoData ?? const TodoData())) {
    on<TodoEventAdd>((event, emit) async {
      try {
        emit(LoadingTodoState(state.todoData));
        await todoRepositoryImpl.addTodo(state.todoData.copyWith(
            uid: FirebaseAuth.instance.currentUser?.uid,
            id: DateTime.now().millisecondsSinceEpoch.toString()));
        emit(SuccessTodoState(state.todoData));
      } catch (e) {
        emit(ErrorTodoState(state.todoData));
        Future.delayed(const Duration(seconds: 2), () {
          emit(InitialTodoState(state.todoData));
        });
      }
    });

    on<TodoEventEdit>((event, emit) async {
      try {
        emit(LoadingTodoState(state.todoData));
        await todoRepositoryImpl.editTodo(event.todoData);
        emit(SuccessTodoState(state.todoData));
      } catch (e) {
        emit(ErrorTodoState(state.todoData));
        Future.delayed(const Duration(seconds: 2), () {
          emit(InitialTodoState(state.todoData));
        });
      }
    });

    on<AddDateTodoEvent>((event, emit) async {
      DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(), //get today's date
        firstDate: DateTime
            .now(), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime.now().add(
          const Duration(days: 1000),
        ),
      );
      if (pickedDate != null) {
        emit(
          InitialTodoState(
            state.todoData.copyWith(
              date: pickedDate.toString(),
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
