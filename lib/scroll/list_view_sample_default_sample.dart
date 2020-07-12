import 'package:flutter/material.dart';

class MListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(

      children: <Widget>[
        Container(
          height: 50,
          color: Colors.blueAccent,
//          child: new Center(child: new Text("SingleChildScrollView",),),
          child: const Center(
            child: Text(
              "Hello World",
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),

        Container(
          height: 50,
          color: Colors.redAccent,
          child: const Center(
            child: Text(
              "SingleChildScrollView",
              style: const TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}