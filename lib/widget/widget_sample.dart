import 'package:flutter/material.dart';
import 'package:flutter_study_samples/widget/row_column.dart';
import 'flex_sample.dart';
import 'image/image_sample.dart';
import 'row_sample.dart';
import 'column_sample.dart';

class WidgetSamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WidgetSamples"),
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
  final List<String> widgetList = ["Flex", "Row", "Column","Image"];

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
      case "Flex":
        _navigateToPage(context, FlexSamplePage());
//        _navigateToPage(context, ExpandedSamplePage());
        break;
      case "Row":
        _navigateToPage(context, RowSamplePage1());
        break;
      case "Column":
        _navigateToPage(context, ColumnSamplePage());
        break;
      case "Image":
        _navigateToPage(context, ImageSamplePage());
        break;
    }
  }

  _navigateToPage(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return widget;
    }));

  }
}
