import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  List<String> todos = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
      ),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: todos.length,
        itemBuilder: (context, index, animation) {
          return SlideTransition(
            position: animation.drive(
              Tween<Offset>(
                begin: Offset(1, 0),
                end: Offset.zero,
              ),
            ),
            child: Dismissible(
              key: Key(todos[index]),
              onDismissed: (direction) {
                setState(() {
                  todos.removeAt(index);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Item dismissed'),
                  ),
                );
              },
              child: ListTile(
                title: Text(todos[index]),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              String newTodo = '';
              return AlertDialog(
                title: const Text('Add Todo'),
                content: TextField(
                  onChanged: (value) {
                    newTodo = value;
                  },
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        todos.add(newTodo);
                        _listKey.currentState?.insertItem(todos.length - 1);
                      });
                      Navigator.pop(context);
                    },
                    child: Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
