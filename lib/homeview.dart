// Hemvy med en to do list

import 'package:flutter/material.dart';
import 'package:template/secondview.dart';
import 'package:provider/provider.dart';
import 'datahanterare.dart';

//Hemvy
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataHanterare>(
        builder: (context, DataHanterare state, child) => Scaffold(
            appBar: AppBar(
              title: Text('To Do List'),
              backgroundColor: Colors.blueGrey,
              elevation: 4,
              actions: [
                PopupMenuButton(
                  onSelected: (String value) {
                    Provider.of<DataHanterare>(context, listen: false)
                        .setFilterBy(value);
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(child: Text('All'), value: 'All'),
                    PopupMenuItem(child: Text('Done'), value: 'Done'),
                    PopupMenuItem(child: Text('Undone'), value: 'Undone'),
                  ],
                )
              ],
            ),
            body:
                listOfTodos(context, _filterList(state.todos, state.filterBy)),
            floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.blueGrey,
                elevation: 6,
                onPressed: () async {
                  var newTodo = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SecondView()));
                },
                child: Icon(Icons.add))));
  }

  //Lista
  Widget listOfTodos(BuildContext context, List<Todo> todos) {
    return ListView(
      children: todos.map((item) => _item(context, item)).toList(),
    );
  }

  //Todo
  Widget _item(context, Todo todo) {
    return CheckboxListTile(
      value: todo.status,
      onChanged: (bool? newValue) {
        Provider.of<DataHanterare>(context, listen: false)
            .updatestate(todo, newValue!);
      },
      title: Text(todo.task),
      secondary: IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          Provider.of<DataHanterare>(context, listen: false).removetodo(todo);
        },
      ),
      controlAffinity: ListTileControlAffinity.leading,
      checkColor: Color.fromARGB(255, 5, 29, 70),
      activeColor: Colors.blueGrey,
      checkboxShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
    );
  }

  List<Todo> _filterList(list, filterBy) {
    if (filterBy == 'All') return list;
    if (filterBy == 'Done')
      return list.where((todo) => todo.status == true).toList();
    if (filterBy == 'Undone')
      return list.where((todo) => todo.status == false).toList();
    return list;
  }
}
