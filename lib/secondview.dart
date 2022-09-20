// Vy två, där en uppgift kan adderas till to do listan

import 'package:flutter/material.dart';
import 'package:template/datahanterare.dart';
import 'package:provider/provider.dart';

class SecondView extends StatelessWidget {
  TextEditingController userInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do List'),
        backgroundColor: Colors.blueGrey,
        elevation: 4,
      ),
      body: Padding(
          padding: EdgeInsets.all(30),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextField(
                decoration: InputDecoration(
                    labelText: 'What are you going to do?',
                    contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    floatingLabelStyle: TextStyle(color: Colors.grey)),
                textInputAction: TextInputAction.done,
                cursorColor: Colors.grey,
                controller: userInput),
            MaterialButton(
              onPressed: () {
                Provider.of<DataHanterare>(context, listen: false)
                    .addtodo(userInput.text, false);
                Navigator.pop(context, Todo(userInput.text, false));
              },
              color: Colors.blueGrey,
              textColor: Colors.white,
              elevation: 4,
              child: Text('ADD'),
            )
          ])),
    );
  }
}
