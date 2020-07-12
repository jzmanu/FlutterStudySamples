import 'package:flutter/material.dart';

/// Hello World
class HelloWorldPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Hello World",
            style: TextStyle(fontSize: 18),
          )),
      body: new Center(
        child: new Text(
          "Hello World!",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
