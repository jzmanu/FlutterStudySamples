import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// StatefulWidget
/// 表示有状态的 Widget
class StatefulSamplePage extends StatefulWidget {
  @override
  _StatefulSamplePageState createState() => _StatefulSamplePageState();
}

class _StatefulSamplePageState extends State<StatefulSamplePage> {
  DateFormat _dateFormat;
  String _currentTime;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _dateFormat = new DateFormat("yyyy-MM-dd HH:mm:ss");
    // 初始化当前时间
    _currentTime = _dateFormat.format(DateTime.now());
    // 更新时间
    _startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Stateful Widget sample"),
          centerTitle: true,
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: Text("当前时间：$_currentTime"),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    if(_timer!=null){
      _timer.cancel();
    }
  }

  _startTime() {
    const Duration duration = Duration(seconds: 1);
    _timer = Timer.periodic(
        duration,
        (Timer timer) => {
              // 刷新界面状态
              setState(() {
                _currentTime = _dateFormat.format(DateTime.now());
              })
            });
  }
}
