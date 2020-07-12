import 'package:flutter/widgets.dart';

/// 全局配置类
///

GlobalConfig globalConfig = new GlobalConfig();

class GlobalConfig {
  // 解决了Navigator.popAndPushNamed返回时如果携带数据的上下文问题
  GlobalKey _scaffoldKey;
  BuildContext context;

  GlobalConfig() {
    _scaffoldKey = new GlobalKey();
  }

  GlobalKey get scaffoldKey => _scaffoldKey;

}
