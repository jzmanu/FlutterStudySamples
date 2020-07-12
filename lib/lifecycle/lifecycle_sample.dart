import 'package:flutter/material.dart';
import 'package:flutter_study_samples/lifecycle/stateful_sample.dart';
import 'package:flutter_study_samples/lifecycle/stateless_sample.dart';
import 'package:flutter_study_samples/lifecycle/widget_lifecycle_sample.dart';

/// Flutter Widget生命周期
class LifecycleSamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widget Life Sample"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 1, 0, 0),
        child: WidgetListView(),
      ),
    );
  }
}

class WidgetListView extends StatelessWidget {
  final List<String> widgetList = ["Stateless Widget", "Stateful Widget","Widget Lifecycle"];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: Container(
            height: 50,
            color: Colors.blue,
            child: Center(
              child: Text(
                "${widgetList[index]}",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          onTap: () => _navigateTo(context, widgetList[index]),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          height: 1,
          color: Colors.white,
        );
      },
      itemCount: widgetList.length,
    );
  }

  _navigateTo(BuildContext context, String name) {
    switch (name) {
      case "Stateless Widget":
        _navigateToPage(context, StatelessSamplePage("Stateless Widget"));
        break;
      case "Stateful Widget":
        _navigateToPage(context, StatefulSamplePage());
        break;
      case "Widget Lifecycle":
        _navigateToPage(context,  WidgetLifecycleSamplePage());
        break;
    }
  }

  _navigateToPage(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return widget;
    }));
  }
}







