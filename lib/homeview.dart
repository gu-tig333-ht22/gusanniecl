import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:template/secondview.dart';
import 'package:provider/provider.dart';
import 'datafrominternet.dart';

//Hemvy
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyState>(
      builder: (context, MyState state, child) => Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
          title: Text(
            'TO DO LIST',
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          ),
          flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(255, 255, 255, 255)
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter))),
          elevation: 0,
          actions: [
            PopupMenuButton(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Icon(
                  Icons.more_horiz,
                  color: Colors.black,
                ),
              ),
              onSelected: (String value) {
                Provider.of<MyState>(context, listen: false).setFilterBy(value);
              },
              itemBuilder: (context) => [
                PopupMenuItem(child: Text('All'), value: 'All'),
                PopupMenuItem(child: Text('Done'), value: 'Done'),
                PopupMenuItem(child: Text('Undone'), value: 'Undone')
              ],
            ),
          ],
        ),
        body: listOfTodos(context, _filterList(state.todolist, state.filterBy)),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 157, 177, 195),
            elevation: 6,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondView()));
            },
            child: Icon(
              Icons.add,
              color: Color.fromARGB(255, 0, 0, 0),
            )),
      ),
    );
  }

  //Listvy
  Widget listOfTodos(BuildContext context, List<Todo> todos) {
    return ListView(
      children: todos.map((item) => _item(context, item)).toList(),
    );
  }

  //Todo
  Widget _item(context, Todo todo) {
    return Container(
      margin: EdgeInsets.only(top: 12, bottom: 12, left: 30, right: 30),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 99, 128, 151),
            Color.fromARGB(255, 157, 177, 195)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(18)),
      child: CheckboxListTile(
        side: BorderSide(color: Colors.black),
        value: todo.status,
        onChanged: (bool? newValue) {
          Provider.of<MyState>(context, listen: false)
              .updateStatus(todo.id, todo.task, newValue);
        },
        title: Text(
          todo.task,
          overflow: TextOverflow.ellipsis,
          style: todo.status == true
              ? const TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.lineThrough,
                  fontWeight: FontWeight.w400,
                )
              : const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
        ),
        secondary: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Provider.of<MyState>(context, listen: false).removeTodo(todo.id);
          },
        ),
        controlAffinity: ListTileControlAffinity.leading,
        checkColor: Color.fromARGB(255, 0, 0, 0),
        activeColor: Color.fromARGB(255, 255, 255, 255),
        checkboxShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
      ),
    );
  }

  List<Todo> _filterList(List<Todo> list, filterBy) {
    if (filterBy == 'All') return list;
    if (filterBy == 'Done') {
      return list.where((todo) => todo.status == true).toList();
    } else {
      return list.where((todo) => todo.status == false).toList();
    }
  }
}
