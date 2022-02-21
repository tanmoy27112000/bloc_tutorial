import 'package:bloc_tutorial/bloc/todo_bloc.dart';
import 'package:bloc_tutorial/model/todo_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TodoBloc _todoBloc = TodoBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoBloc, TodoState>(
      bloc: _todoBloc,
      listener: (context, state) {},
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const Scaffold(),
          loaded: (todoList) => Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    _todoBloc.add(
                      TodoEvent.addTodo(
                        TodoItem(
                          description: "test description",
                          title: "Test title ${todoList.length + 1}",
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            body: todoList.isEmpty
                ? const Center(
                    child: Text("No item added"),
                  )
                : ListView.builder(
                    itemCount: todoList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(todoList[index].title),
                        subtitle: Text(todoList[index].description),
                      );
                    },
                  ),
          ),
          error: (val) {
            return Scaffold(
              appBar: AppBar(
                title: const Text("Error"),
              ),
              body: const Center(
                child: Text("Error"),
              ),
            );
          },
        );
      },
    );
  }
}
