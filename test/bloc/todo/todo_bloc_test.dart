import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todox/features/todo/bloc/todo_bloc.dart';
import 'package:todox/features/todo/data/repository/todo_repo_impl.dart';
import 'package:todox/features/todo/page/add_task.dart';
import 'package:todox/core/data/todo/todo_data.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'todo_bloc_test.mocks.dart';

@GenerateMocks([TodoRepositoryImpl])
void main() {
  group('TodoBloc test', () {
    late MockTodoRepositoryImpl todoRepository;
    late TodoBloc todoBloc;

    setUp(() {
      todoRepository = MockTodoRepositoryImpl();
      todoBloc = TodoBloc(
        todoRepositoryImpl: todoRepository,
        todoData: null,
        addTodoType: AddTodoType.create,
      );
    });

    test('initial state is correct', () {
      expect(todoBloc.state, isA<InitialTodoState>());
    });

    blocTest(
      'Add task title',
      build: () => todoBloc,
      act: (bloc) => todoBloc.add(AddTitleTodoEvent('my task')),
      expect: () => [
        isA<InitialTodoState>()
            .having((p0) => p0.todoData.title, 'is', "my task")
      ],
    );

    blocTest(
      'Add task note ',
      build: () => todoBloc,
      act: (bloc) => todoBloc.add(AddNoteTodoEvent('this is a new task')),
      expect: () => [
        isA<InitialTodoState>()
            .having((p0) => p0.todoData.note, 'is', "this is a new task")
      ],
    );

    blocTest(
      'Add note date',
      build: () => todoBloc,
      act: (bloc) => todoBloc.add(AddDateTodoEvent(DateTime(2024))),
      expect: () => [
        isA<InitialTodoState>()
            .having((p0) => p0.todoData.date, 'is', DateTime(2024).toString())
      ],
    );

    blocTest(
      'save task',
      setUp: () {
        when(todoRepository.addTodo(const TodoData()))
            .thenAnswer((realInvocation) => Future.value(true));
      },
      build: () => todoBloc,
      act: (bloc) => todoBloc.add(SaveEventAdd()),
      expect: () => [isA<LoadingTodoState>(), isA<ErrorTodoState>()],
    );
  });
}
