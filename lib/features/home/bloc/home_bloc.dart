import 'package:bloc/bloc.dart';
import 'package:todox/core/data/todo/todo_data.dart';
import 'package:todox/features/todo/data/repository/todo_repo_impl.dart';

part 'home_event.dart';
part 'home_state.dart';

class AuthBloc extends Bloc<TodoEvent, HomeState> {
  final TodoRepositoryImpl todoRepositoryImpl;
  AuthBloc({required this.todoRepositoryImpl}) : super(InitialHomeState()) {
    on<TodoEventAdd>((event, emit) async {
      try {
        emit(LoadingHomeState());
        todoRepositoryImpl.getTodo().listen((event) {
          emit(LoadingLoadedState(event));
        });
      } catch (e) {
        emit(ErrorTodoState());
      }
    });
  }
}
