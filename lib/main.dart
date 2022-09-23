import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'homeview.dart';
import 'datafrominternet.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var fetchList = MyState();
    return ChangeNotifierProvider(
      create: (context) => fetchList,
      child: MaterialApp(
        home: MyHomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
