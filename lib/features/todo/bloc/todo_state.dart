part of 'todo_bloc.dart';

abstract class TodoState {
  final TodoData todoData;
  TodoState(this.todoData);


  bool  get todoValid{
    if(todoData.note!=null&&todoData.title!=null&&todoData.date!=null){
      return true;
    }
    return false;
  }

}

class InitialTodoState extends TodoState {
  InitialTodoState(super.todoData);
}

class LoadingTodoState extends TodoState {
  LoadingTodoState(super.todoData);
}

class SuccessTodoState extends TodoState {
  SuccessTodoState(super.todoData);
}

class ErrorTodoState extends TodoState {
  ErrorTodoState(super.todoData);
}
