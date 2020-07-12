import 'package:flutter/material.dart';

/// StatelessWidget
/// 表示无状态Widget
class StatelessSamplePage extends StatelessWidget {

  // 外部传入数据
  final String data;
  StatelessSamplePage(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue,
      child: Text(data),
    );
  }
}
