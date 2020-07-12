import 'package:flutter/material.dart';

/// flex

class FlexSamplePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flex Smaple"),
        centerTitle: true,
      ),
      body: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        textBaseline: TextBaseline.ideographic,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Container(
              width: 50,
              height: 50,
              color: Colors.red,
              child: Align(
                alignment: Alignment.center,
                child: Text("A",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                    textAlign: TextAlign.center),
              )),
          Container(
              width: 50,
              height: 100,
              color: Colors.green,
              child: Align(
                child: Text(
                  "B",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              )),
          Container(
              width: 50,
              height: 80,
              color: Colors.yellow,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "y",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              )),
        ],
      ),
    );
  }
}

class FlexSamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flex Sample"),
        centerTitle: true,
      ),
      body: Row(
        children: <Widget>[
          Expanded(
              child: Row(
                children: <Widget>[
                  Text("躬",style: TextStyle(fontSize: 40,),),
                  Text("x",style: TextStyle(fontSize: 60,),),
                  Text("ing",style: TextStyle(fontSize: 16,),),
                  Text("之",style: TextStyle(fontSize: 16,),),
                ],
          )),
          Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text("躬",style: TextStyle(fontSize: 40,),),
                  Text("x",style: TextStyle(fontSize: 60,),),
                  Text("ing",style: TextStyle(fontSize: 16,),),
                  Text("之",style: TextStyle(fontSize: 16, ),),
                ],
          )),
          Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.ideographic,
                children: <Widget>[
                  Text("躬",style: TextStyle(fontSize: 40, ),),
                  Text("x",style: TextStyle(fontSize: 60,),),
                  Text("ing",style: TextStyle(fontSize: 16,),),
                  Text("之",style: TextStyle(fontSize: 16,),),
                ],
              ))
        ],
      ),
    );
  }
}

class ExpandedSamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flex Smaple"),
        centerTitle: true,
      ),
      body: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
//          Container(
//              width: 50,
//              height: 50,
//              color: Colors.red,
//              child: Center(
//                child: Text(
//                  "A",
//                  style: TextStyle(fontSize: 20, color: Colors.white),
//                ),
//              )),
//          Expanded(
//            flex: 1,
//            child: Container(
//                width: 50,
//                height: 50,
//                color: Colors.green,
//                child: Center(
//                  child: Text(
//                    "B",
//                    style: TextStyle(fontSize: 20, color: Colors.white),
//                  ),
//                )),
//          ),
//          Container(
//              width: 50,
//              height: 50,
//              color: Colors.yellow,
//              child: Center(
//                child: Text(
//                  "C",
//                  style: TextStyle(fontSize: 20, color: Colors.white),
//                ),
//              )),
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
                width: 50, // Row Expanded下width无效
                height: 50, // Column Expanded下height无效
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
                  "C",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              )),
        ],
      ),
    );
  }
}
