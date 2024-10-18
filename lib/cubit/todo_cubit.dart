import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/models/todo.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  void addTodo(Todo todo) {
    if (null == todo.name || "" == todo.name) {
      addError("Title can not be null");
      return;
    }
    emit([...state, todo]);
  }

  void checkTodo(Todo todo, int index) {
    final newList = state;
    newList[index] = todo;
    emit([...newList]);
  }

  @override
  void onChange(Change<List<Todo>> change) {
    if (kDebugMode) {
      print(" TodoCubit :  $change");
    }
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      print(" TodoCubit error :  $error");
    }
    super.onError(error, stackTrace);
  }
}
