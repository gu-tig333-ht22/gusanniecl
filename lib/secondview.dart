import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:template/datafrominternet.dart';
import 'package:provider/provider.dart';

class SecondView extends StatelessWidget {
  TextEditingController userInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
        title: Text('ADD TODO', style: TextStyle(color: Colors.black)),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.white, Colors.white],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter)),
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                    decoration: InputDecoration(
                        labelText: 'What are you going to do?',
                        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey)),
                        floatingLabelStyle: TextStyle(color: Colors.grey)),
                    textInputAction: TextInputAction.done,
                    cursorColor: Colors.grey,
                    controller: userInput),
                TextButton(
                  child: Text(
                    'ADD',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  onPressed: () {
                    if (userInput.text != '') {
                      Provider.of<MyState>(context, listen: false)
                          .addTodo(userInput.text);
                      Navigator.pop(context);
                    }
                  },
                )
              ])),
    );
  }
}
