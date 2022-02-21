import 'package:bloc_tutorial/bloc/todo_bloc.dart';
import 'package:bloc_tutorial/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoBloc>(
          create: (context) => TodoBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Material App',
        home: Homepage(),
      ),
    );
  }
}
