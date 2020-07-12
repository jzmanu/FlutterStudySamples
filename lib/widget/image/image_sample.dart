import 'package:flutter/material.dart';

import 'image_load.dart';
import 'image_property.dart';

/// Image Sample
class ImageSamplePage extends StatelessWidget {
  final List<String> imageList = ["Image Property", "Image load"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Sample"),
        centerTitle: true,
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: Container(
                height: 50,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    "${imageList[index]}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              onTap: () => _navigateTo(context, imageList[index]),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: 1,
              color: Colors.white,
            );
          },
          itemCount: imageList.length),
    );
  }

  _navigateTo(BuildContext context, String name) {
    switch (name) {
      case "Image Property":
        _navigateToPage(context, ColorPage());
        break;
      case "Image load":
        _navigateToPage(context, ImageLoadSamplePage());
        break;
    }
  }

  _navigateToPage(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return widget;
    }));
  }
}
