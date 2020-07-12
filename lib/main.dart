import 'package:flutter/material.dart';
import 'package:flutter_study_samples/lifecycle/lifecycle_sample.dart';

import 'hello/hello_world_sample.dart';
import 'scroll/single_child_scroll_view_sample.dart';
import 'function/navigator_sample.dart';
import 'function/file_sample.dart';
import 'widget/widget_sample.dart';
import 'widget/test.dart';
import 'config/config.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        // 对应路由
        NavigatorSamplePage.routeName: (BuildContext context) =>
            NavigatorSamplePage(),
        NavigatorPushNamedPage.routeName: (BuildContext context) =>
            NavigatorPushNamedPage(),
        NavigatorPushNamedReturnParamPage.routeName: (BuildContext context) =>
            NavigatorPushNamedReturnParamPage(),
      },
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == NavigatorPushNamedWithParamPage.routeName) {
          return MaterialPageRoute<String>(builder: (BuildContext context) {
            return NavigatorPushNamedWithParamPage(settings.arguments);
          });
        } else if(settings.name == NavigatorPopAndPushNamedPage.routeName){
          return MaterialPageRoute<String>(builder: (BuildContext context) {
            return NavigatorPopAndPushNamedPage(settings.arguments);
          });
        }else{
          print("---settings.name--->"+settings.name);
          return null;
        }
      },
    );
  }
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: globalConfig.scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Flutter Samples"),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(0, 1, 0, 0),
          child: MListView(),
        ));
  }
}

class MListView extends StatelessWidget {
  final List<String> dataList = [
    "Hello World",
    "Navigator",
    "Basic Widget",
    "SingleChildScrollView",
    "File",
    "Widget Life",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
//            print(dataList[index]);
            _toDetailPage(context, index);
          },
          child: Container(
            height: 50,
            color: Colors.blue,
            child: Center(
              child: Text(
                "${dataList[index]}",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          height: 1,
          color: Colors.white,
        );
      },
      itemCount: dataList.length,
    );
  }

  void _toDetailPage(BuildContext context, int index) {
    switch (index) {
      case 0: // Hello World
        _navigateToPage(context, HelloWorldPage());
        break;
      case 1: // Navigator
//        _navigateToPage(context, NavigatorSamplePage());
        Navigator.pushNamed(context, NavigatorSamplePage.routeName);
        break;
      case 2: // Basic Widget
        _navigateToPage(context, WidgetSamplePage());
        break;
      case 3: // SingleChildScrollView
        _navigateToPage(context, MSingleChildScrollView());
        break;
      case 4: // File
        _navigateToPage(context, MyHomePage());
        break;
      case 5: // Widget Life
        _navigateToPage(context, LifecycleSamplePage());
        break;
    }
  }

  /// push/pop
  void _navigateToPage(BuildContext context, Widget widget) {
    Navigator.push(context,
        new MaterialPageRoute(builder: (BuildContext context) {
      return widget;
    }));
  }
}
