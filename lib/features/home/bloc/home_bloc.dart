import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todox/core/data/todo/todo_data.dart';
import 'package:todox/features/todo/data/repository/todo_repo_impl.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TodoRepositoryImpl todoRepositoryImpl;
  HomeBloc({required this.todoRepositoryImpl}) : super(InitialHomeState()) {
    on<LoadTodoRequestEvent>((event, emit) async {
      try {
        emit(LoadingHomeState());
        todoRepositoryImpl
            .getTodo(FirebaseAuth.instance.currentUser?.uid ?? "")
            .listen((event) async {
          add(LoadTodoHomeEvent(event));
        });
      } catch (e) {
        emit(ErrorTodoState());
      }
    });

    on<LoadTodoHomeEvent>((event, emit) {
      emit(
        LoadedHomeState(
          allTodo: event.todo,
          pendingTodo:
              event.todo.where((element) => element.status == false).toList(),
          completedTodo:
              event.todo.where((element) => element.status == true).toList(),
        ),
      );
    });

    on<EditTodoHomeEvent>((event, emit) {
      todoRepositoryImpl.editTodo(
        event.todoData.copyWith(status: event.status),
      );
    });

    on<LogoutHomeEvent>((event, emit) {
      FirebaseAuth.instance.signOut();
    });
  }
}
