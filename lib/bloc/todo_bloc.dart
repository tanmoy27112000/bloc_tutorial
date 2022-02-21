import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/model/todo_item_model.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_bloc.freezed.dart';
part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  List<TodoItem> todoItems = [];
  TodoBloc() : super(const _Loaded([]));

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    yield* event.map(
      started: (val) async* {
        yield _Loaded(todoItems);
      },
      addTodo: (event) async* {
        yield const _Loading();
        todoItems.add(event.title);
        if (todoItems.length == 10) {
          yield const _Error("there was a error");
        } else {
          yield _Loaded(todoItems);
        }
      },
    );
  }
}
