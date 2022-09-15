// Hemvy med en to do list

import 'package:flutter/material.dart';
import 'package:template/secondview.dart';

// Klass för att skapa task i to do list
class Todo {
  String task;
  bool status;

  Todo(this.task, this.status);
}

//Hemvy
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var todo = Todo('task', false);
    return Scaffold(
        appBar: AppBar(
          title: Text('To Do List'),
          backgroundColor: Colors.blueGrey,
          elevation: 4,
          actions: [_dropdownmenu()],
        ),
        body: _list(),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blueGrey,
            elevation: 6,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondView()));
            },
            child: Icon(Icons.add)));
  }

  // Lista som visar todo´s
  Widget _list() {
    List<Todo> listOfTodos = [
      Todo('Task', false),
      Todo('Task1', false),
      Todo('Task2', false),
      Todo('Task3', false),
      Todo('Task4', false),
    ];
    return ListView(
      children: listOfTodos.map((item) => _item(item)).toList(),
    );
  }

// Todo
  Widget _item(Todo todo) {
    return CheckboxListTile(
        value: todo.status,
        onChanged: (val) {},
        title: Text(todo.task),
        secondary: Icon(Icons.close),
        controlAffinity: ListTileControlAffinity.leading,
        checkColor: Color.fromARGB(255, 5, 29, 70),
        activeColor: Colors.blueGrey,
        checkboxShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)));
  }

//Filtermeny
  DropdownMenuItem<String> filter(String value) {
    return DropdownMenuItem(
      value: value,
      child: Text(value),
    );
  }

  Widget _dropdownmenu() {
    return DropdownButtonHideUnderline(
        child: Container(
      color: Colors.blueGrey,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: DropdownButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            items: [filter('All'), filter('Done'), filter('Undone')],
            onChanged: (value) {}),
      ),
    ));
  }
}
