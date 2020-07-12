import 'package:flutter/material.dart';

///
/// Row组件
class RowSamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Row Sample"),
          centerTitle: true,
        ),
        body:
//        ConstrainedBox(
//          constraints: BoxConstraints(maxWidth: 300,minWidth: 100),
//          child:
            Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                width: 50,
                height: 50,
                color: Colors.red,
                child: Center(
                  child: Text(
                    "A",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                )),
            Container(
                width: 50,
                height: 50,
                color: Colors.green,
                child: Center(
                  child: Text(
                    "B",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                    textDirection: TextDirection.ltr,
                  ),
                )),
//              Expanded(
//                flex: 1, // weight
//                child:
            Container(
                width: 50, // Row无效
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
        )
//      )
        );
  }
}

// Row
class RowSamplePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Row Sample"),
          centerTitle: true,
        ),
        body: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 150),
          child: Row(
            children: <Widget>[
              Container(
                width: 80,
                height: 80,
                color: Colors.red,
              ),
              Spacer(flex: 1,),
              Container(
                width: 80,
                height: 80,
                color: Colors.green,
              ),
              Spacer(flex: 2,),
              Container(
                width: 80,
                height: 80,
                color: Colors.yellow,
              ),
            ],
          ),
        ));
  }
}
