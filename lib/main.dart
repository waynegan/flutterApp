import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoListPage(),
    );
  }
}

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final List<String> _todoItems = [];
  final TextEditingController _textController = TextEditingController();

  void _addTodoItem(String task) {
    if (task.isNotEmpty) {
      setState(() {
        _todoItems.add(task);
      });
      _textController.clear();
    }
  }

  void _removeTodoItem(int index) {
    setState(() {
      _todoItems.removeAt(index);
    });
  }

  void _promptRemoveTodoItem(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Remove "${_todoItems[index]}"?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                _removeTodoItem(index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildTodoItem(String todoText, int index) {
    return ListTile(
      title: Text('Row number:' '${index} '),
      trailing: Text('$todoText', style: TextStyle(fontSize: 18.0)),
      onLongPress: () => _promptRemoveTodoItem(index),
    );
  }

  Widget _buildTodoList() {
    if (_todoItems.isEmpty) {
      return Center(
        child: Text('There are no items in the list'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return _buildTodoItem(_todoItems[index], index);
        },
        itemCount: _todoItems.length,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do List'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                ElevatedButton(
                  child: Text('Add'),
                  onPressed: () => _addTodoItem(_textController.text),
                ),
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: 'Enter a task',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _buildTodoList(),
          ),
        ],
      ),
    );
  }
}
