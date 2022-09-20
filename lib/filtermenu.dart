import 'package:flutter/material.dart';

//Filtermeny

DropdownMenuItem<String> filter(String value) {
  return DropdownMenuItem(
    value: value,
    child: Text(value),
  );
}

class filtermenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
        child: Container(
      color: Colors.blueGrey,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: DropdownButton(
            icon: Icon(Icons.more_vert, color: Colors.white),
            items: [filter('All'), filter('Done'), filter('Undone')],
            onChanged: (value) {}),
      ),
    ));
  }
}
