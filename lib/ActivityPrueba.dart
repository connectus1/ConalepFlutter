import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      title: "Titutlo de la aplicacion",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Welcome to flutter"),
        ),
        body: Center(
          child: Text("Hello world"),
        ),
      ),
    );
  }
}
