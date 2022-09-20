import 'package:flutter/material.dart';

// Klass för att skapa en todo i todo list
class Todo {
  String task;
  bool status;

  Todo(this.task, this.status);
  bool get value => status;
  setIsDone(bool? newValue) {
    status = newValue!;
  }
}

//String GetMessage => _message

class DataHanterare extends ChangeNotifier {
  final List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  //Lägg till todo i listan
  // void addtodo(Todo todoadd) {
  // _todos.add(todoadd);
  // notifyListeners();
  //}

  void addtodo(String newtask, bool taskstate) {
    _todos.add(Todo(newtask, taskstate));
    notifyListeners();
  }

  //Ta bort Todo från listan
  void removetodo(Todo todoremove) {
    _todos.remove(todoremove);
    notifyListeners();
  }

  void updatestate(Todo todo, bool newValue) {
    todo.setIsDone(newValue);
    notifyListeners();
  }
}
