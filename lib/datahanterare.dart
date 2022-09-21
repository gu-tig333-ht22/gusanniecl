import 'package:flutter/material.dart';

//Class for creating todo's
class Todo {
  String task;
  bool status;

  Todo(this.task, this.status);
  bool get value => status;
  setIsDone(bool? newValue) {
    status = newValue!;
  }
}

class DataHanterare extends ChangeNotifier {
  final List<Todo> _todos = [];
  String _filterBy = 'All';

  List<Todo> get todos => _todos;

  String get filterBy => _filterBy;

  // Add todo to list
  void addtodo(String newtask, bool taskstate) {
    _todos.add(Todo(newtask, taskstate));
    notifyListeners();
  }

  // Remove todo from list
  void removetodo(Todo todoremove) {
    _todos.remove(todoremove);
    notifyListeners();
  }

  // Change value of todo (done/undone)
  void updatestate(Todo todo, bool newValue) {
    todo.setIsDone(newValue);
    notifyListeners();
  }

  //Todo list filter function
  void setFilterBy(String filterBy) {
    this._filterBy = filterBy;
    notifyListeners();
  }
}
