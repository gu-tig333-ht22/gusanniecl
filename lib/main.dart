import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'homeview.dart';
import 'datahanterare.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var dataHanterare = DataHanterare();
    return ChangeNotifierProvider(
      create: (context) => dataHanterare,
      child: MaterialApp(
        home: MyHomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
