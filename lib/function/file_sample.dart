import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

/// File Samples
class FileSamplePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    _getExternalPath();
    return Scaffold(
        appBar: AppBar(
          title: Text("File Sample"),
          centerTitle: true,
        ),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints boxConstraints) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: boxConstraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: <Widget>[],
                  ),
                )),
          );
        }));
  }

  /// 获取存储目录
  void _getExternalPath() async {
    /// 获取外置存储目录
    /// Android 对应context.getExternalFilesDir，/storage/emulated/0/Android/data/com.manu.flutter_study_samples/files
    Directory directory1 = await getExternalStorageDirectory();

    /// IOS 对应NSDocumentDirectory API
    /// Android /data/user/0/com.manu.flutter_study_samples/app_flutter
    Directory directory2 = await getApplicationDocumentsDirectory();
    /// IOS 对应NSApplicationSupportDirectory API
    /// Android 对应context.getFilesDir，/data/user/0/com.manu.flutter_study_samples/files
//    Directory directory3 = await getApplicationSupportDirectory();

    /// 获取缓存目录
    /// IOS 对应NSCachesDirectory API
    /// Android 对应Android context.getCacheDir，/data/user/0/com.manu.flutter_study_samples/cache
    Directory directory = await getTemporaryDirectory();

    print("---getExternalStorageDirectory--->${directory1.path}");
    print("---getApplicationDocumentsDirectory--->${directory2.path}");
//    print("---getApplicationSupportDirectory--->${directory3.path}");
    print("---getTemporaryDirectory--->${directory.path}");
  }



}




