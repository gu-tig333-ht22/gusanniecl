import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyState extends ChangeNotifier {
  List<Todo> todolist = [];

  static String apikey = '?key=4b788996-b89f-485e-95df-7c75d8ef4e1c';
  static String url = 'https://todoapp-api.apps.k8s.gu.se';
  static String getlist = '/todos';

  String _filterBy = 'All';
  String get filterBy => _filterBy;

  MyState() {
    newTodoList();
  }

  List<Todo> get list => todolist;

  // Hämta lista
  Future newTodoList() async {
    http.Response response = await http.get(
      Uri.parse("$url$getlist$apikey"),
    );
    createList(jsonDecode(response.body));
  }

  // Lägg till todo
  Future addTodo(String newTodoName) async {
    http.Response response = await http.post(
      Uri.parse('$url$getlist$apikey'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'title': newTodoName}),
    );
    createList(jsonDecode(response.body));
  }

  // Uppdatera status på todo

  void updateStatus(String id, String task, bool? newValue) async {
    print('$url$getlist$id$apikey');
    http.Response response = await http.put(
      Uri.parse('$url$getlist/$id$apikey'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'title': task,
        'done': newValue,
      }),
    );
    createList(jsonDecode(response.body));
  }

  // Ta bort todo
  Future removeTodo(String id) async {
    http.Response response =
        await http.delete(Uri.parse('$url$getlist/$id$apikey'));

    createList(jsonDecode(response.body));
  }

  //Filtrera lista
  void setFilterBy(String filterBy) {
    this._filterBy = filterBy;
    notifyListeners();
  }

  void createList(data) {
    todolist.clear();
    data.forEach((todo) {
      todolist.add(Todo(
        task: todo['title'],
        id: todo['id'],
        status: todo['done'],
      ));
    });
    notifyListeners();
  }
}

class Todo {
  late String _task;
  String id = '';
  bool? _status = false;

  Todo(
      {required String task,
      required String id,
      bool status = false,
      bool delete = false}) {
    this._task = task;
    this.id = id;
    this._status = status;
  }

  String get task => _task;
  bool? get status => _status;

  setTask(
    String newTask,
  ) {
    _task = newTask;
  }

  setIsDone(bool? newStatus) {
    _status = newStatus;
  }
}
