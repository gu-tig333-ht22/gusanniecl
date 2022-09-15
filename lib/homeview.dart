// Hemvy med en to do list

import 'package:flutter/material.dart';
import 'package:template/secondview.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('To Do List'),
          backgroundColor: Colors.blueGrey,
          elevation: 4,
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert_sharp),
              onPressed: () {},
            )
          ],
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              _checkboxRow(),
              _checkboxRow(),
              _checkboxRow(),
              _checkboxRow(),
              _checkboxRow(),
              _checkboxRow()
            ])),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondView()));
            }));
  }

Widget _checkboxRow() {
  return Row(
    children: [
      Checkbox(
        value: false,
        onChanged: (val) {},
      ),
      Text('Task'),
      Icon(Icons.close)
    ],
  );
}
