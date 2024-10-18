import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/cubit/todo_cubit.dart';
import 'package:todo_list/models/todo.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: BlocBuilder<TodoCubit, List<Todo>>(
        builder: (context, todoList) {
          return todoList.isEmpty
              ? const Center(child: Text("No todos"))
              : ListView.builder(
                  itemCount: todoList.length,
                  itemBuilder: (context, index) {
                    final todo = todoList[index];

                    return ListTile(
                      title: Text(todo.name,
                          style: TextStyle(
                              decoration: todo.isDone!
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none)),
                      leading: Checkbox(
                          value: todo.isDone,
                          onChanged: (value) {
                            var newTodo = Todo(
                                name: todo.name,
                                createdAt: todo.createdAt,
                                isDone: value,
                                text: todo.text);
                            context.read<TodoCubit>().checkTodo(newTodo, index);
                          }),
                    );
                  });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-todo');
        },
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
