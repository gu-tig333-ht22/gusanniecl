// Skapa hemvyn med to do listan

import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do List'),
      ),
      body: Center(
        child: Column(
          children: [
            _task(),
            _task(),
            _task(),
          ],
        ),
      ),
    );
  }

  Widget _task() {
    return Text('Uppgift');
  }
}
