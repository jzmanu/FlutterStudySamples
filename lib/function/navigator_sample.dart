import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:flutter_study_samples/config/config.dart';
import 'package:flutter_study_samples/hello/hello_world_sample.dart';

/// Navigator
/// 页面跳转相关
class NavigatorSamplePage extends StatelessWidget {
  static final routeName = "/NavigatorSamplePage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigator Samples"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 1, 0, 0),
        child: _NavigatorSampleListView(),
      ),
    );
  }
}

/// ListView
class _NavigatorSampleListView extends StatelessWidget {
  final List<String> navigatorList = [
    "Navigator.push/pop",
    "Navigator.push携带参数",
    "Navigator.pop返回时携带参数",
    "Navigator.pushNamed",
    "Navigator.pushNamed携带参数",
    "Navigator.pushNamed返回时携带参数",
    "Navigator.popAndPushNamed",
    "Navigator.popUntil",
    "Navigator.pushAndRemoveUntil",
    "Navigator.pushReplacement"
  ];

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
                  "${navigatorList[index]}",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            onTap: () => _navigateSample(context, index),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 1,
            color: Colors.white,
          );
        },
        itemCount: navigatorList.length);
  }

  _navigateSample(BuildContext context, int index) {
    switch (index) {
      case 0: // Navigator.push/pop
        _navigateToPage(context, NavigatorPushPopPage());
        break;
      case 1: // Navigator.push携带参数
        _navigateToPage(
            context,
            NavigatorPushWithParamPage(
              param: "this info from last page!",
            ));
        break;
      case 2: // Navigator.pop返回携带参数
        _navigatePopWithParamPage(context, NavigatorPopWithParamPage());
        break;
      case 3: // Navigator.pushNamed
        _navigatePushNamedPage(context, NavigatorPushNamedPage.routeName);
        break;
      case 4: // Navigator.pushNamed携带参数
        _navigatePushNamedPage(
            context,
            NavigatorPushNamedWithParamPage.routeName,
            "this info from last page!");
        break;
      case 5: // Navigator.pushNamed返回时携带参数
        _navigatorPushNamedReturnParamPage(
            context, NavigatorPushNamedReturnParamPage.routeName);
        break;
      case 6: // Navigator.popAndPushNamed
        _navigatePopAndPushNamedPage(
            context, NavigatorPopAndPushNamedPage.routeName,
            result: "popAndPushNamed", arguments: "popAndPushNamed");
        break;
      case 7: // Navigator.ppUntil
        _navigateToPage(context, NavigatorPopUntilPage());
        break;
      case 8: // Navigator.pushAndRemoveUntil
        _navigateToPage(context, NavigatorPushAndRemoveUntilPage());
        break;
      case 9: // Navigator.pushReplacement
        _navigateToPage(context, NavigatorPushReplacementPage());
        break;
    }
  }

  /// Navigator.push/pop
  /// 页面跳转
  _navigateToPage(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return widget;
    }));
  }

  /// Navigator.pop返回时携带参数
  _navigatePopWithParamPage(BuildContext context, Widget widget) {
    Navigator.push<String>(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return widget;
    })).then((result) {
      Toast.show("Navigator.pop返回时携带参数：" + result, context);
    });
  }

  /// Navigator.pushNamed
  _navigatePushNamedPage(BuildContext context, String routeName,
      [Object arguments]) {
    Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  /// Navigator.pushNamed返回时携带参数
  _navigatorPushNamedReturnParamPage(BuildContext context, String routeName,
      [Object arguments]) {
    Navigator.pushNamed(context, routeName, arguments: arguments)
        .then((result) {
      Toast.show("Navigator.pop返回时携带参数：" + result, context);
    });
  }

  /// Navigator.popAndPushNamed
  /// 从Navigator中移除当前所在路由再跳转到新的路由，相当于finish再startActivity
  _navigatePopAndPushNamedPage(BuildContext context, String routeName,
      {String result, String arguments}) {
    /// 参数：(上下文、路由名称、{pop回退结果，pushNamed携带参数})
    Navigator.popAndPushNamed(context, routeName,
            result: result, arguments: arguments)
        .then((result) {
      // Unhandled Exception: Looking up a deactivated widget's ancestor is unsafe.
      // 此时使用context会因为上下文不匹配为报错，故选择首页Scaffold中的上下文可解决这个问题
      // 可以回调成功，参数为null，有待研究
//      print("--popAndPushNamed-->" + result);
//      Toast.show("---", globalConfig.scaffoldKey.currentContext,
//          duration: Toast.LENGTH_LONG);
    });
  }
}

/// page
/// Navigator.push/pop
class NavigatorPushPopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigator.push/pop"),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
      ),
      body: Center(
        child: Text(
          "Navigator.push/pop",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

/// page
/// Navigator.push携带参数
class NavigatorPushWithParamPage extends StatelessWidget {
  final String param;

  NavigatorPushWithParamPage({
    this.param,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigator.push携带参数"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "arguments:${this.param}",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

/// page
/// Navigator.pop返回时携带参数
class NavigatorPopWithParamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Navigator.pop返回时携带参数"),
            centerTitle: true,
          ),
          body: Center(
            child: Text(
              "Navigator.pop返回时携带参数",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        onWillPop: () => _popBack(context));
  }

  /// 页面返回并设置返回参数，类似Android中的setResult方法
  _setResult(BuildContext context) {
    Navigator.pop(context, "this message from NavigatorPopWithParamPage!");
  }

  /// 统一处理返回键
  Future<bool> _popBack(BuildContext context) {
    _setResult(context);
    return Future.value(false);
  }
}

/// page
/// Navigator.pushNamed
/// 使用已命名路由
class NavigatorPushNamedPage extends StatelessWidget {
  static final routeName = '/NavigatorPushNamedPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigator.pushNamed"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "Navigator.pushNamed",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

/// page
/// Navigator.pushNamed携带参数
/// 使用已命名路由
class NavigatorPushNamedWithParamPage extends StatelessWidget {
  static final String routeName = '/NavigatorPushNamedWithParamPage';
  final String info;

  NavigatorPushNamedWithParamPage(this.info);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Navigator.pushNamed携带参数"),
          centerTitle: true,
        ),
        body: Center(
          child: Text(
            "arguments:${this.info}",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}

/// page
/// Navigator.pushNamed返回时携带参数
/// 使用已命名路由
class NavigatorPushNamedReturnParamPage extends StatelessWidget {
  static final String routeName = '/NavigatorPushNamedReturnParamPage';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Navigator.pushNamed返回时携带参数"),
              centerTitle: true,
            ),
            body: Center(
              child: Text(
                "Navigator.pushNamed返回时携带参数",
                style: TextStyle(fontSize: 18),
              ),
            )),
        onWillPop: () => _popBack(context));
  }

  /// 页面返回并设置返回参数，类似Android中的setResult方法
  _setResult(BuildContext context) {
    Navigator.pop(
        context, "this message from NavigatorPushNamedReturnParamPage!");
  }

  /// 统一处理返回键
  Future<bool> _popBack(BuildContext context) {
    _setResult(context);
    return Future.value(false);
  }
}

/// page
/// popAndPushNamed
/// 从Navigator中移除当前所在路由再跳转到新的路由，相当于finish再startActivity
class NavigatorPopAndPushNamedPage extends StatelessWidget {
  static final String routeName = '/NavigatorPopAndPushNamedPage';
  final String arguments;

  NavigatorPopAndPushNamedPage(this.arguments);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigator.popAndPushNamed"),
        centerTitle: true,
      ),
      body: new Center(
        child: Text(
          "arguments:${this.arguments}",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

/// popUntil
/// 根据指定的Route直接返回，在此之前的路由会被清除
class NavigatorPopUntilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigator.popUntil"),
        centerTitle: true,
      ),
      body: Center(
          child: FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: Text("Navigator.popUntil"),
                    ),
                    floatingActionButton: FloatingActionButton(
                      onPressed: () {
                        Navigator.popUntil(context, ModalRoute.withName("/"));
                      },
                      child: Center(
                        child: Icon(Icons.home),
                      ),
                    ),
                    body: Center(
                      child: Text(
                        "B",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  );
                }));
              },
              child: Text(
                "A",
                style: TextStyle(fontSize: 18),
              ))),
    );
  }
}

/// pushAndRemoveUntil
/// 跳转到新的Route，并将指定Route之前的的Route清空
/// pushNamedAndRemoveUntil与之类似但是可以传递参数
class NavigatorPushAndRemoveUntilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigator.pushAndRemoveUntil"),
        centerTitle: true,
      ),
      body: Center(
          child: FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return BPage();
                }));
              },
              child: Text(
                "A",
                style: TextStyle(fontSize: 18),
              ))),
    );
  }
}

class BPage extends StatelessWidget {
  static final String routeName = "/BPage";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigator.pushAndRemoveUntil"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _pushAndRemoveUntil(context, HelloWorldPage()),
        child: Center(
          child: Text("Hello"),
        ),
      ),
      body: Center(
        child: Text(
          "B",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  _pushAndRemoveUntil(BuildContext context, Widget widget) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => widget),
        ModalRoute.withName(NavigatorSamplePage.routeName));
  }
}

/// Navigator.pushReplacement
/// Navigator.pushReplacementNamed与之类似
class NavigatorPushReplacementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigator.pushReplacement"),
        centerTitle: true,
      ),
      body: Center(
        child: FlatButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  new MaterialPageRoute(builder: (BuildContext context) {
                return HelloWorldPage();
              }));
            },
            child: Text("A")),
      ),
    );
  }
}

/// 参数类
class Person {
  final String name;
  final int age;

  Person(this.name, this.age);

  @override
  String toString() {
    return "{ name:$name,age:$age}";
  }

}
