import 'package:flutter/material.dart';

// Column
class ColumnSamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Row Sample"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                  child: Center(
                    child: Text(
                      "A",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )),
            ),
            Expanded(
              flex: 2,
              child: Container(
                  width: 50, // Row Expanded下width无效，Column
                  height: 50,
                  color: Colors.green,
                  child: Center(
                    child: Text(
                      "B",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )),
            ),
            Container(
                width: 50,
                height: 50,
                color: Colors.yellow,
                child: Center(
                  child: Text(
                    "A",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                )),
//              ),
          ],
        ));
  }
}
