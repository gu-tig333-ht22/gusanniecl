// Vy två, där en uppgift kan adderas till to do listan

import 'package:flutter/material.dart';

class SecondView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do List'),
        backgroundColor: Colors.blueGrey,
        elevation: 4,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Text('What are you going to do?'), Icon(Icons.add)]),
      ),
    );
  }
}
