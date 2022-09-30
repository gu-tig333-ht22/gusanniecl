import 'package:flutter/material.dart';
import 'homeview.dart';
import 'package:provider/provider.dart';
import 'datafrominternet.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyState(),
      child: MaterialApp(
        home: MyHomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
