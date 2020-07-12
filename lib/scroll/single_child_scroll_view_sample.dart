import 'package:flutter/material.dart';

class MSingleChildScrollView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SingleChildScrollView"),
        centerTitle: true,
      ),
      body: MyStatelessWidget(),
    );
  }
}

//class MSingleChildScrollView extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//
//    return SingleChildScrollView(
//      scrollDirection: Axis.vertical,
//    );
//  }
//
//}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: <Widget>[
                  Container(
                    color: const Color(0xffff0000),
                    height: 120.0,
                  ),
                  Container(
                    color: const Color(0xff00ff00),
                    height: 120.0,
                  ),
                  Container(
                    color: const Color(0xff0000ff),
                    height: 120.0,
                  ),
                  Container(
                    color: const Color(0xffff0000),
                    height: 120.0,
                  ),
                  Container(
                    color: const Color(0xff00ff00),
                    height: 120.0,
                  ),
                  Container(
                    color: const Color(0xff0000ff),
                    height: 120.0,
                  ),
                  Container(
                    color: const Color(0xffff0000),
                    height: 120.0,
                  ),
                  Container(
                    color: const Color(0xff00ff00),
                    height: 120.0,
                  ),
                  Container(
                    color: const Color(0xff0000ff),
                    height: 120.0,
                  ),
                  Expanded(
                    // A flexible child that will grow to fit the viewport but
                    // still be at least as big as necessary to fit its contents.
                    child: Container(
                      color: const Color(0xff333333), // Red
                      height: 120.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
