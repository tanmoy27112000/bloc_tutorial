import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/model/todo_item_model.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_bloc.freezed.dart';
part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  List<TodoItem> todoItems = [];
  TodoBloc() : super(const _Loaded([])) {
    on<TodoEvent>((event, emit) {
      event.map(
        started: (val) {
          emit(TodoState.loaded(todoItems));
        },
        addTodo: (val) {
          emit(const TodoState.loading());
          todoItems.add(val.title);
          emit(TodoState.loaded(todoItems));
        },
      );
    });
  }
}
