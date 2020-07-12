import 'package:flutter/material.dart';

///图片Widget属性
class ImagePropertySamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Property"),
        centerTitle: true,
      ),
      body: Image.asset(
        "images/cat50.jpg",
        width: 300,
        height: 200,

        /// 与无障碍服务有关
//        semanticLabel: "TalkBack",
//        excludeFromSemantics: false,
//        color: Colors.green,
//        colorBlendMode: BlendMode.multiply,
//      repeat: ImageRepeat.repeat,
      ),
    );
  }
}

/// frameBuilder
class FrameBuilderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Property"),
        centerTitle: true,
      ),
      body: Image.network(
        "https://cdn.nlark.com/yuque/0/2019/jpeg/644330/1576812507787-bdaeaf42-8317-4e06-a489-251686bf7b91.jpeg",
        width: 100,
        height: 100,
        frameBuilder: (BuildContext context, Widget child, int frame,
            bool wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded) {
            return child;
          }
          print("--frame->$frame");
          print("--wasSynchronouslyLoaded->$wasSynchronouslyLoaded");
          return AnimatedOpacity(
            opacity: frame == null ? 0.0 : 1.0,
            duration: Duration(seconds: 3),
            child: child,
            curve: Curves.easeOut,
          );
        },
      ),
    );
  }
}

/// loadingBuilder
class LoadingBuilderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Property"),
        centerTitle: true,
      ),
      body: Image.network(
        "https://cdn.nlark.com/yuque/0/2019/jpeg/644330/1576812507787-bdaeaf42-8317-4e06-a489-251686bf7b91.jpeg",
        width: 100,
        height: 100,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent loadingProgress) {
          if (loadingProgress == null) return child;
          print("--child->$child");
          print("--loadingProgress->$loadingProgress");
          int currentLength = loadingProgress.cumulativeBytesLoaded;
          int totalLength = loadingProgress.expectedTotalBytes;
          print("$currentLength/$totalLength from network");
          return CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes
                : null,
          );
        },
      ),
    );
  }
}

/// alignment
class FitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("alignment"),
        centerTitle: true,
      ),
      body: Image.asset(
        "images/cat.jpg",
        width: 200,
        height: 100,
        fit: BoxFit.cover,
      ),
    );
  }
}

/// fit
class Fit1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("fit"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: IntrinsicHeight(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      color: Colors.lightBlueAccent,
                      width: 150,
                      height: 70,
                      child: Image.asset(
                        "images/cat.jpg",
                        width: 20,
                        height: 20,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Expanded(
                        child: Center(
                      child: Text(
                        "Alignment.topLeft",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ))
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

/// alignment
class AlignmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("alignment"),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.lightBlueAccent,
          width: 150,
          height: 70,
          child: Image.asset(
            "images/cat50.jpg",
            alignment: Alignment.center,
          ),
        ));
  }
}

/// alignment all
class AlignmentTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("alignment"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: IntrinsicHeight(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      color: Colors.lightBlueAccent,
                      width: 150,
                      height: 70,
                      child: Image.asset(
                        "images/cat50.jpg",
                        alignment: Alignment.topLeft,
                      ),
                    ),
                    Expanded(
                        child: Center(
                      child: Text(
                        "Alignment.topLeft",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      color: Colors.lightBlueAccent,
                      width: 150,
                      height: 70,
                      margin: EdgeInsets.fromLTRB(0, 1, 0, 0),
                      child: Image.asset(
                        "images/cat50.jpg",
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    Expanded(
                        child: Center(
                      child: Text(
                        "Alignment.topLeft",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      color: Colors.lightBlueAccent,
                      width: 150,
                      height: 70,
                      margin: EdgeInsets.fromLTRB(0, 1, 0, 0),
                      child: Image.asset(
                        "images/cat50.jpg",
                        alignment: Alignment.topRight,
                      ),
                    ),
                    Expanded(
                        child: Center(
                      child: Text(
                        "Alignment.topLeft",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      color: Colors.lightBlueAccent,
                      width: 150,
                      height: 70,
                      margin: EdgeInsets.fromLTRB(0, 1, 0, 0),
                      child: Image.asset(
                        "images/cat50.jpg",
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    Expanded(
                        child: Center(
                      child: Text(
                        "Alignment.topLeft",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      color: Colors.lightBlueAccent,
                      width: 150,
                      height: 70,
                      margin: EdgeInsets.fromLTRB(0, 1, 0, 0),
                      child: Image.asset(
                        "images/cat50.jpg",
                        alignment: Alignment.center,
                      ),
                    ),
                    Expanded(
                        child: Center(
                      child: Text(
                        "Alignment.topLeft",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      color: Colors.lightBlueAccent,
                      width: 150,
                      height: 70,
                      margin: EdgeInsets.fromLTRB(0, 1, 0, 0),
                      child: Image.asset(
                        "images/cat50.jpg",
                        alignment: Alignment.centerRight,
                      ),
                    ),
                    Expanded(
                        child: Center(
                      child: Text(
                        "Alignment.topLeft",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      color: Colors.lightBlueAccent,
                      width: 150,
                      height: 70,
                      margin: EdgeInsets.fromLTRB(0, 1, 0, 0),
                      child: Image.asset(
                        "images/cat50.jpg",
                        alignment: Alignment.bottomLeft,
                      ),
                    ),
                    Expanded(
                        child: Center(
                      child: Text(
                        "Alignment.topLeft",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      color: Colors.lightBlueAccent,
                      width: 150,
                      height: 70,
                      margin: EdgeInsets.fromLTRB(0, 1, 0, 0),
                      child: Image.asset(
                        "images/cat50.jpg",
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                    Expanded(
                        child: Center(
                      child: Text(
                        "Alignment.topLeft",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      color: Colors.lightBlueAccent,
                      width: 150,
                      height: 70,
                      margin: EdgeInsets.fromLTRB(0, 1, 0, 0),
                      child: Image.asset(
                        "images/cat50.jpg",
                        alignment: Alignment.bottomRight,
                      ),
                    ),
                    Expanded(
                        child: Center(
                      child: Text(
                        "Alignment.topLeft",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ))
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

/// repeat
class RepeatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("repeat"),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.lightBlueAccent,
          width: 120,
          height: 120,
          child: Image.asset(
            "images/cat50.jpg",
            alignment: Alignment.topLeft,
            repeat: ImageRepeat.noRepeat,
          ),
        ));
  }
}

/// centerSlice
/// Image的宽高只是图片容器的宽高，与图片是否填充显示无关
class CenterSlicePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("centerSlice"),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.amber,
              child: Image.asset(
                "images/circle100.png",
                width: 300,
                height: 200,
              ),
            ),
            Container(
              color: Colors.yellow,
              child: Image.asset(
                "images/circle100.png",
                width: 300,
                height: 200,
                centerSlice: Rect.fromLTWH(50, 50, 10, 10),
              ),
            ),
            Container(
              color: Colors.amber,
              child: Image.asset(
                "images/circle100.png",
                width: 300,
                height: 200,
                centerSlice: Rect.fromLTWH(50, 50, 50, 50),
              ),
            ),
          ],
        ));
  }
}

/// centerSlice
class CenterSlicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("centerSlice"),
          centerTitle: true,
        ),
        body: Container(
//          width: 100,
//          height: 100,
          constraints: BoxConstraints(
              minWidth: 100, maxWidth: 400, minHeight: 100, maxHeight: 600),
//          padding: EdgeInsets.fromLTRB(24, 24, 16, 16),
          padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("images/bubble.png"),
            centerSlice: Rect.fromLTWH(4, 4, 50, 30),
          )),
          child: Text(
            "12345678901234567890123456789012345678901234567890",
          ),
        ));
  }
}

/// matchTextDirection
class MatchTextDirectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("matchTextDirection"),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "matchTextDirection: false,",
              style: TextStyle(fontSize: 18),
            ),
            Image.asset(
              "images/cat100.jpg",
            ),
            Text(
              "matchTextDirection: true,",
              style: TextStyle(fontSize: 18),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Image.asset(
                "images/cat100.jpg",
                matchTextDirection: true,
              ),
            ),
          ],
        ));
  }
}

/// filterQuality
class FilterQualityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("matchTextDirection"),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              "images/cat100.jpg",
              width: 300,
              height: 300,
              fit: BoxFit.fill,
              filterQuality: FilterQuality.low,
            ),
            Image.asset(
              "images/cat100.jpg",
              width: 300,
              height: 300,
              fit: BoxFit.fill,
              filterQuality: FilterQuality.high,
            ),
          ],
        ));
  }
}

/// color/colorBlendMode
class ColorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("color"),
        centerTitle: true,
      ),
      body: Center(
        child: Image.asset(
          "images/circle100.png",
          fit: BoxFit.cover,
          color: Colors.yellow,
          colorBlendMode: BlendMode.srcOver,
          filterQuality: FilterQuality.high,
        ),
      )
    );
  }
}

/// color/colorBlendMode
class ColorTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("alignment"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: IntrinsicHeight(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset(
                      "images/circle100.jpg",
                      color: Colors.yellow,
                      colorBlendMode: BlendMode.src,
                    ),
                    Expanded(
                        child: Center(
                          child: Text(
                            "BlendMode.src",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ))
                  ],
                ),

                Row(
                  children: <Widget>[
                    Image.asset(
                      "images/circle100.jpg",
                      color: Colors.yellow,
                      colorBlendMode: BlendMode.dst,
                    ),
                    Expanded(
                        child: Center(
                          child: Text(
                            "BlendMode.dst",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ))
                  ],
                ),

                Row(
                  children: <Widget>[
                    Image.asset(
                      "images/circle100.jpg",
                      color: Colors.yellow,
                      colorBlendMode: BlendMode.color,
                    ),
                    Expanded(
                        child: Center(
                          child: Text(
                            "BlendMode.color",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Image.asset(
                      "images/circle100.jpg",
                      color: Colors.yellow,
                      colorBlendMode: BlendMode.clear,
                    ),
                    Expanded(
                        child: Center(
                          child: Text(
                            "BlendMode.clear",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Image.asset(
                      "images/circle100.jpg",
                      color: Colors.yellow,
                      colorBlendMode: BlendMode.srcOver,
                    ),
                    Expanded(
                        child: Center(
                          child: Text(
                            "BlendMode.srcOver",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Image.asset(
                      "images/circle100.jpg",
                      color: Colors.yellow,
                      colorBlendMode: BlendMode.dstOver,
                    ),
                    Expanded(
                        child: Center(
                          child: Text(
                            "BlendMode.dstOver",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Image.asset(
                      "images/circle100.jpg",
                      color: Colors.yellow,
                      colorBlendMode: BlendMode.srcIn,
                    ),
                    Expanded(
                        child: Center(
                          child: Text(
                            "BlendMode.srcIn",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Image.asset(
                      "images/circle100.jpg",
                      color: Colors.yellow,
                      colorBlendMode: BlendMode.dstIn,
                    ),
                    Expanded(
                        child: Center(
                          child: Text(
                            "BlendMode.dstIn",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Image.asset(
                      "images/circle100.png",
                      color: Colors.yellow,
                      colorBlendMode: BlendMode.srcOut,
                    ),
                    Expanded(
                        child: Center(
                          child: Text(
                            "BlendMode.srcOut",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Image.asset(
                      "images/circle100.png",
                      color: Colors.yellow,
                      colorBlendMode: BlendMode.dstOut,
                    ),
                    Expanded(
                        child: Center(
                          child: Text(
                            "BlendMode.dstOut",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Image.asset(
                      "images/circle100.jpg",
                      color: Colors.yellow,
                      colorBlendMode: BlendMode.srcATop,
                    ),
                    Expanded(
                        child: Center(
                          child: Text(
                            "BlendMode.srcATop",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Image.asset(
                      "images/circle100.jpg",
                      color: Colors.yellow,
                      colorBlendMode: BlendMode.dstATop,
                    ),
                    Expanded(
                        child: Center(
                          child: Text(
                            "BlendMode.dstATop",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Image.asset(
                      "images/circle100.jpg",
                      color: Colors.yellow,
                      colorBlendMode: BlendMode.xor,
                    ),
                    Expanded(
                        child: Center(
                          child: Text(
                            "BlendMode.xor",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Image.asset(
                      "images/circle100.jpg",
                      color: Colors.yellow,
                      colorBlendMode: BlendMode.plus,
                    ),
                    Expanded(
                        child: Center(
                          child: Text(
                            "BlendMode.plus",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Image.asset(
                      "images/circle100.jpg",
                      color: Colors.yellow,
                      colorBlendMode: BlendMode.modulate,
                    ),
                    Expanded(
                        child: Center(
                          child: Text(
                            "BlendMode.modulate",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Image.asset(
                      "images/circle100.jpg",
                      color: Colors.yellow,
                      colorBlendMode: BlendMode.screen,
                    ),
                    Expanded(
                        child: Center(
                          child: Text(
                            "BlendMode.screen",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Image.asset(
                      "images/circle100.jpg",
                      color: Colors.yellow,
                      colorBlendMode: BlendMode.overlay,
                    ),
                    Expanded(
                        child: Center(
                          child: Text(
                            "BlendMode.overlay",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Image.asset(
                      "images/circle100.jpg",
                      color: Colors.yellow,
                      colorBlendMode: BlendMode.darken,
                    ),
                    Expanded(
                        child: Center(
                          child: Text(
                            "BlendMode.darken",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Image.asset(
                      "images/circle100.jpg",
                      color: Colors.yellow,
                      colorBlendMode: BlendMode.lighten,
                    ),
                    Expanded(
                        child: Center(
                          child: Text(
                            "BlendMode.lighten",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Image.asset(
                      "images/circle100.jpg",
                      color: Colors.yellow,
                      colorBlendMode: BlendMode.colorDodge,
                    ),
                    Expanded(
                        child: Center(
                          child: Text(
                            "BlendMode.colorDodge",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Image.asset(
                      "images/circle100.jpg",
                      color: Colors.yellow,
                      colorBlendMode: BlendMode.colorBurn,
                    ),
                    Expanded(
                        child: Center(
                          child: Text(
                            "BlendMode.colorBurn",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Image.asset(
                      "images/circle100.jpg",
                      color: Colors.yellow,
                      colorBlendMode: BlendMode.hardLight,
                    ),
                    Expanded(
                        child: Center(
                          child: Text(
                            "BlendMode.hardLight",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Image.asset(
                      "images/circle100.jpg",
                      color: Colors.yellow,
                      colorBlendMode: BlendMode.softLight,
                    ),
                    Expanded(
                        child: Center(
                          child: Text(
                            "BlendMode.softLight",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Image.asset(
                      "images/circle100.jpg",
                      color: Colors.yellow,
                      colorBlendMode: BlendMode.difference,
                    ),
                    Expanded(
                        child: Center(
                          child: Text(
                            "BlendMode.difference",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Image.asset(
                      "images/circle100.jpg",
                      color: Colors.yellow,
                      colorBlendMode: BlendMode.exclusion,
                    ),
                    Expanded(
                        child: Center(
                          child: Text(
                            "BlendMode.exclusion",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Image.asset(
                      "images/circle100.jpg",
                      color: Colors.yellow,
                      colorBlendMode: BlendMode.multiply,
                    ),
                    Expanded(
                        child: Center(
                          child: Text(
                            "BlendMode.multiply",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Image.asset(
                      "images/circle100.jpg",
                      color: Colors.yellow,
                      colorBlendMode: BlendMode.hue,
                    ),
                    Expanded(
                        child: Center(
                          child: Text(
                            "BlendMode.hue",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Image.asset(
                      "images/circle100.jpg",
                      color: Colors.yellow,
                      colorBlendMode: BlendMode.saturation,
                    ),
                    Expanded(
                        child: Center(
                          child: Text(
                            "BlendMode.saturation",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Image.asset(
                      "images/circle100.jpg",
                      color: Colors.yellow,
                      colorBlendMode: BlendMode.luminosity,
                    ),
                    Expanded(
                        child: Center(
                          child: Text(
                            "BlendMode.luminosity",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ))
                  ],
                ),

              ],
            ),
          ),
        ));
  }
}
