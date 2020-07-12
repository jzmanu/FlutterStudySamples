import 'package:flutter/material.dart';
import 'package:flutter_study_samples/util/Log.dart';

const String TAG = "Flutter";
/// Widget生命周期
class WidgetLifecycleSamplePage extends StatefulWidget {
  @override
  _WidgetLifecycleSamplePageState createState() {
    Log.info(TAG, "parent createState");
    return _WidgetLifecycleSamplePageState();
  }
}

class _WidgetLifecycleSamplePageState extends State<WidgetLifecycleSamplePage> {

  num _count = 0;

  @override
  void initState() {
    super.initState();
    Log.info(TAG, "parent initState");
  }

  @override
  Widget build(BuildContext context) {
    Log.info(TAG, "parent build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Widget Lifecycle Sample"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: RaisedButton(
                textColor:Colors.white,
                color: Colors.lightBlue,
                child: Text("parent->setState:$_count",style: TextStyle(color: Colors.white),),
                onPressed: (){
                  setState(() {
                    Log.info(TAG, "parent setState");
                    _count++;
                  });
                }),
          ),
          SubWidgetLifecycleSamplePage(),
        ],
      )
    );
  }

  @override
  void didUpdateWidget(WidgetLifecycleSamplePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    Log.info(TAG, "parent didUpdateWidget");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Log.info(TAG, "parent didChangeDependencies");
  }

  @override
  void deactivate() {
    super.deactivate();
    Log.info(TAG, "parent deactivate");
  }

  @override
  void reassemble() {
    super.reassemble();
    Log.info(TAG, "parent reassemble");
  }

  @override
  void dispose() {
    super.dispose();
    Log.info(TAG, "parent dispose");
  }
}

/// 子Widget
class SubWidgetLifecycleSamplePage extends StatefulWidget {
  @override
  _SubWidgetLifecycleSamplePageState createState() {
    Log.info(TAG, "sub createState");
    return _SubWidgetLifecycleSamplePageState();
  }
}

class _SubWidgetLifecycleSamplePageState extends State<SubWidgetLifecycleSamplePage> {

  num _count = 0;

  @override
  void initState() {
    super.initState();
    Log.info(TAG, "sub initState");
  }

  @override
  Widget build(BuildContext context) {
    Log.info(TAG, "sub build");
    return Center(
      child: RaisedButton(
          textColor:Colors.white,
          color: Colors.lightBlue,
          child: Text("sub->setState:$_count",style: TextStyle(color: Colors.white),),
          onPressed: (){
            setState(() {
              Log.info(TAG, "sub setState");
              _count++;
            });
          }),
    );
  }

  @override
  void didUpdateWidget(SubWidgetLifecycleSamplePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    Log.info(TAG, "sub didUpdateWidget");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Log.info(TAG, "sub didChangeDependencies");
  }

  @override
  void deactivate() {
    super.deactivate();
    Log.info(TAG, "sub deactivate");
  }

  @override
  void reassemble() {
    super.reassemble();
    Log.info(TAG, "sub reassemble");
  }

  @override
  void dispose() {
    super.dispose();
    Log.info(TAG, "sub dispose");
  }
}


