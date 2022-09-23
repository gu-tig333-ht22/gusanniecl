import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Felmeddelande när ny todo ska läggas till:
//FormatException (FormatException: Unexpected character (at character 1)
//<!DOCTYPE html>

class MyState extends ChangeNotifier {
  List<Todo> todolist = [];

  String apikey = '4b788996-b89f-485e-95df-7c75d8ef4e1c';
  String url = 'https://todoapp-api.apps.k8s.gu.se/';
  String getlist = '/todos';

  String _filterBy = 'All';
  String get filterBy => _filterBy;

  TodoHandler() {
    newTodoList();
  }

  List<Todo> get list => todolist;

  // Hämta lista
  Future newTodoList() async {
    http.Response response = await http.get(
      Uri.parse("$url$getlist$apikey"),
    );
    todolist = createList(jsonDecode(response.body));
    notifyListeners();
  }

  // Lägg till todo
  Future addTodo(String newTodoName) async {
    http.Response response = await http.post(
      Uri.parse('$url$getlist$apikey'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"title": newTodoName}),
    );
    createList(jsonDecode(response.body));
    notifyListeners();
  }

  // Uppdatera status på todo
  Future updateTodoStatus(Todo todoToUpdate) async {
    http.Response response = await http.put(
      Uri.parse("$url$getlist/${todoToUpdate.id}$apikey"),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "title": todoToUpdate.task,
        "done": !todoToUpdate.status,
      }),
    );
    todolist = createList(json.decode(response.body));
    notifyListeners();
  }

  // Ta bort todo
  Future removeTodo(Todo todoToRemove) async {
    String tempUrl = "$url$getlist${todoToRemove.id}$apikey";
    http.Response response = await http.delete(
      Uri.parse("$url$getlist/${todoToRemove.id}$apikey"),
    );
    todolist = createList(json.decode(response.body));
    notifyListeners();
  }

  //Filtrera lista
  void setFilterBy(String filterBy) {
    this._filterBy = filterBy;
    notifyListeners();
  }

  List<Todo> createList(data) {
    List<Todo> newTodoList = [];
    data.forEach((todo) {
      newTodoList.add(Todo(
        task: todo["title"],
        id: todo["id"],
        status: todo["done"],
      ));
    });
    return newTodoList;
  }
}

class Todo {
  var _task;
  var _status;
  var _id;
  Todo({String task = "", String id = "", status = false}) {
    this._task = task;
    this._status = status;
    this._id = id;
  }

  String get task => _task;
  bool get status => _status;
  String get id => _id;

  set task(String newTask) {
    _task = newTask;
  }

  setIsDone() {
    _status = !status;
  }
}
