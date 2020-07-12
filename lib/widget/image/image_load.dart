import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:ui' as ui show Image;

import 'package:path_provider/path_provider.dart';
import 'package:toast/toast.dart';

/// 加载图片
class ImageLoadSamplePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ImageSampleSate();
  }
}
/// _ImageSampleSate
class _ImageSampleSate extends State<ImageLoadSamplePage> {
  Future<Directory> _externalStorageDirectory;
  Future<Uint8List> _imageUint8List;

//  Image image = Image.network(
//    "https://cdn.nlark.com/yuque/0/2019/jpeg/644330/1576812507787-bdaeaf42-8317-4e06-a489-251686bf7b91.jpeg",
//    width: 100,
//    height: 100,
//    alignment: Alignment.topLeft,
//  );

  /// 获取文件目录
  void _requestExternalStorageDirectory() {
    setState(() {
      _externalStorageDirectory = getExternalStorageDirectory();
    });
  }

  /// 把文件转换成字节
  void _requestBytes() {
    setState(() {
      File file = new File("/storage/emulated/0/owl.jpg");
      _imageUint8List = file.readAsBytes();
    });
  }

  @override
  Widget build(BuildContext context) {
//    Completer<ui.Image> completer = new Completer<ui.Image>();
//    // 图片加载监听
//    image.image.resolve(ImageConfiguration()).addListener(
//            ImageStreamListener((ImageInfo imageInfo, bool synchronousCall) {
//          completer.complete(imageInfo.image);
//        }, onChunk: (event) {
//          int currentLength = event.cumulativeBytesLoaded;
//          int totalLength = event.expectedTotalBytes;
//          print("$currentLength/$totalLength from network");
//        }, onError: (e, trace) {
//          print(e.toString());
//        }));
    _requestExternalStorageDirectory();
    _requestBytes();

    return Scaffold(
      appBar: AppBar(
        title: Text("Image Sample"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _clearCache(context);
        },
        child: Icon(Icons.clear),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Text(
            "from network...",
            style: TextStyle(fontSize: 16),
          ),

          FadeInImage(
            placeholder: AssetImage("images/placeholder.png"),
            width: 100,
            height: 100,
            alignment: Alignment.topLeft,
            image: NetworkImage(
              "https://cdn.nlark.com/yuque/0/2019/jpeg/644330/1576812507787-bdaeaf42-8317-4e06-a489-251686bf7b91.jpeg",
            ),

          ),
          Image.network(
            "https://cdn.nlark.com/yuque/0/2019/jpeg/644330/1576812507787-bdaeaf42-8317-4e06-a489-251686bf7b91.jpeg",
            width: 100,
            height: 100,
            alignment: Alignment.topLeft,
          ),

          Text(
            "from file...",
            style: TextStyle(fontSize: 16),
          ),
          FutureBuilder<Directory>(
            future: _externalStorageDirectory,
            builder: _buildFileDirectory,
          ),
          Text(
            "from asset...",
            style: TextStyle(fontSize: 16),
          ),
          Image.asset(
            'images/cat.jpg',
            width: 100,
            height: 100,
            alignment: Alignment.topLeft,
          ),
          Text(
            "from memory...",
            style: TextStyle(fontSize: 16),
          ),
          FutureBuilder<Uint8List>(
            future: _imageUint8List,
            builder: _buildMemoryDirectory,
          ),
        ],
      ),
    );
  }

  /// 异步获取SD卡图片
  Widget _buildFileDirectory(
      BuildContext context, AsyncSnapshot<Directory> snapshot) {
    Text text = new Text("default");
    if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasData) {
        File file = new File("${snapshot.data.path}/owl.jpg");
        return Image.file(
          file,
          width: 100,
          height: 100,
          alignment: Alignment.topLeft,
        );
      } else if (snapshot.hasError) {
        text = new Text(snapshot.error);
      } else {
        text = const Text("unknow");
      }
    }
    print(text.data);
    return text;
  }


  /// 异步获取内存中图片
  Widget _buildMemoryDirectory(
      BuildContext context, AsyncSnapshot<Uint8List> snapshot) {
    Text text = new Text("default");
    if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasData) {
        return Image.memory(
          snapshot.data,
          width: 100,
          height: 100,
          alignment: Alignment.topLeft,
        );
      } else if (snapshot.hasError) {
        text = new Text(snapshot.error);
      } else {
        text = const Text("unknow");
      }
    }
    return text;
  }

  /// 清理缓存
  _clearCache(BuildContext context) {
    PaintingBinding.instance.imageCache.clear();
    print("---_clearCache-->");
    Toast.show("缓存已清除", context);
  }
}

class MImageProvider extends ImageProvider {
  @override
  ImageStreamCompleter load(key) {
    return null;
  }

  @override
  Future obtainKey(ImageConfiguration configuration) {
    return null;
  }
}

///// ImageProvider是一个抽象类
//abstract class ImageProvider<T> {
//  const ImageProvider();
//
//  /// 使用提供的ImageConfiguration对象生成ImageStream
//  ImageStream resolve(ImageConfiguration configuration) {
//    assert(configuration != null);
//    final ImageStream stream = ImageStream();
//    T obtainedKey;
//
//    //...代码
//
//    dangerZone.runGuarded(() {
//      Future<T> key;
//      try {
//        // 获取图片资源对应的key
//        key = obtainKey(configuration);
//      } catch (error, stackTrace) {
//        handleError(error, stackTrace);
//        return;
//      }
//      key.then<void>((T key) {
//        // 获取到图片资源对应的key
//        obtainedKey = key;
//        // 获取key对应的ImageStreamCompleter，如果缓存中没有则调用传入的loader回调
//        // 去加载并将其添加到缓存中
//        final ImageStreamCompleter completer = PaintingBinding
//            .instance.imageCache
//            .putIfAbsent(key, () => load(key), onError: handleError);
//        if (completer != null) {
//          stream.setCompleter(completer);
//        }
//      }).catchError(handleError);
//    });
//    return stream;
//  }
//
//  /// 将图片从缓存中移除，返回值为true表示移除成功
//  Future<bool> evict(
//      {ImageCache cache,
//      ImageConfiguration configuration = ImageConfiguration.empty}) async {
//    cache ??= imageCache;
//    final T key = await obtainKey(configuration);
//    return cache.evict(key);
//  }
//
//  /// 获取对应图片资源key，具体由子类实现
//  Future<T> obtainKey(ImageConfiguration configuration);
//
//  /// 根据key加载图片并将其转换为ImageStreamCompleter,具体由子类实现
//  @protected
//  ImageStreamCompleter load(T key);
//
//  @override
//  String toString() => '$runtimeType()';
//}

///// ImageStream用来处理图片资源，表示该图片资源还未加载完成,图片资源一旦加载完成，
///// ImageStream的真正数据对象就是由dart:ui.Image和scale构成的ImageInfo，
//class ImageStream extends Diagnosticable {
//  ImageStream();
//
//  /// 管理正在加载中的图片资源，监听图片资源加载，如加载成功、加载中、加载失败
//  ImageStreamCompleter get completer => _completer;
//  ImageStreamCompleter _completer;
//
//  List<ImageStreamListener> _listeners;
//
//  /// 设置一个图片加载监听器，通常由创建ImageStream的ImageProvider自动设置，且每个ImageStream中只能设置一次
//  void setCompleter(ImageStreamCompleter value) {
//    assert(_completer == null);
//    _completer = value;
//    if (_listeners != null) {
//      final List<ImageStreamListener> initialListeners = _listeners;
//      _listeners = null;
//      initialListeners.forEach(_completer.addListener);
//    }
//  }
//
//  /// 添加图片加载监听器
//  void addListener(ImageStreamListener listener) {
//    if (_completer != null) return _completer.addListener(listener);
//    _listeners ??= <ImageStreamListener>[];
//    _listeners.add(listener);
//  }
//
//  /// 移除图片加载监听器
//  void removeListener(ImageStreamListener listener) {
//    if (_completer != null) return _completer.removeListener(listener);
//    assert(_listeners != null);
//    for (int i = 0; i < _listeners.length; i += 1) {
//      if (_listeners[i] == listener) {
//        _listeners.removeAt(i);
//        break;
//      }
//    }
//  }
//
//  Object get key => _completer ?? this;
//
//  @override
//  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//    super.debugFillProperties(properties);
//    // ...
//  }
//}

//import 'image_stream.dart';

//const int _kDefaultSize = 1000;
//const int _kDefaultSizeBytes = 100 << 20; // 100 MiB
//
///// 使用LRU实现的图片缓存。最多100张图片，缓存大小最大100M，缓存由ImageProvider及其子类实现
///// 其缓存实例由PaintingBinding单例持有
//class ImageCache {
//  // 正在加载的图片队列
//  final Map<Object, _PendingImage> _pendingImages = <Object, _PendingImage>{};
//
//  // 缓存队列
//  final Map<Object, _CachedImage> _cache = <Object, _CachedImage>{};
//
//  /// 缓存项的最大数量，
//  int get maximumSize => _maximumSize;
//  int _maximumSize = _kDefaultSize;
//
//  /// 设置缓存项最大数量
//  set maximumSize(int value) {
//    assert(value != null);
//    assert(value >= 0);
//    if (value == maximumSize) return;
//    _maximumSize = value;
//    if (maximumSize == 0) {
//      clear();
//    } else {
//      _checkCacheSize();
//    }
//  }
//
//  /// 当前缓存项的数量
//  int get currentSize => _cache.length;
//
//  /// 最大缓存大小(字节)
//  int get maximumSizeBytes => _maximumSizeBytes;
//  int _maximumSizeBytes = _kDefaultSizeBytes;
//
//  /// 设置缓存大小
//  set maximumSizeBytes(int value) {
//    assert(value != null);
//    assert(value >= 0);
//    if (value == _maximumSizeBytes) return;
//    _maximumSizeBytes = value;
//    if (_maximumSizeBytes == 0) {
//      clear();
//    } else {
//      _checkCacheSize();
//    }
//  }
//
//  /// 缓存当前大小(字节)
//  int get currentSizeBytes => _currentSizeBytes;
//  int _currentSizeBytes = 0;
//
//  /// 清除缓存
//  void clear() {
//    _cache.clear();
//    _pendingImages.clear();
//    _currentSizeBytes = 0;
//  }
//
//  /// 根据对应key移除缓存,移除成功返回true,反之，还在加载完成的图片也会被移出同时移除
//  /// 对应图片加载监听器，避免将其添加到缓存中
//  bool evict(Object key) {
//    final _PendingImage pendingImage = _pendingImages.remove(key);
//    if (pendingImage != null) {
//      pendingImage.removeListener();
//      return true;
//    }
//    final _CachedImage image = _cache.remove(key);
//    if (image != null) {
//      _currentSizeBytes -= image.sizeBytes;
//      return true;
//    }
//    return false;
//  }
//
//  /// 缓存API的入口
//  ///
//  /// 如果缓存可用，从给定key从缓存中获取ImageStreamCompleter返回，反之则使用
//  /// 提供的回调loader()获取ImageStreamCompleter并返回，都会将key移动到最近使用的位置
//  ImageStreamCompleter putIfAbsent(Object key, ImageStreamCompleter loader(),
//      {ImageErrorListener onError}) {
//    assert(key != null);
//    assert(loader != null);
//    ImageStreamCompleter result = _pendingImages[key]?.completer;
//    // 如果图片还未加载完成，直接返回
//    if (result != null) return result;
//    // 如果有对应缓存，先从缓存中移除，然后再添加最近使用的位置
//    final _CachedImage image = _cache.remove(key);
//    if (image != null) {
//      _cache[key] = image;
//      return image.completer;
//    }
//    // 如果获取不到对应缓存，直接使用对应ImageProvider中的load方法加载图片
//    try {
//      result = loader();
//    } catch (error, stackTrace) {
//      if (onError != null) {
//        onError(error, stackTrace);
//        return null;
//      } else {
//        rethrow;
//      }
//    }
//    void listener(ImageInfo info, bool syncCall) {
//      // 加载失败的图片不会占用缓存大小
//      final int imageSize =
//          info?.image == null ? 0 : info.image.height * info.image.width * 4;
//      final _CachedImage image = _CachedImage(result, imageSize);
//      // 如果图片的大小大于缓存大小，且缓存大小不为0，则增加缓存到小到图片缓存大小
//      if (maximumSizeBytes > 0 && imageSize > maximumSizeBytes) {
//        _maximumSizeBytes = imageSize + 1000;
//      }
//      _currentSizeBytes += imageSize;
//      // 从正在加载的图片队列中移除已加载的图片并设置移除监听
//      final _PendingImage pendingImage = _pendingImages.remove(key);
//      if (pendingImage != null) {
//        pendingImage.removeListener();
//      }
//      // 将已加载的图片添加到缓存中
//      _cache[key] = image;
//      // 缓存检查，超过缓存限制则从缓存中移除最近最少使用的缓存项
//      _checkCacheSize();
//    }
//
//    // 添加正在加载的图片到_pendingImages中，并设置加载图片的监听
//    if (maximumSize > 0 && maximumSizeBytes > 0) {
//      final ImageStreamListener streamListener = ImageStreamListener(listener);
//      _pendingImages[key] = _PendingImage(result, streamListener);
//      // Listener is removed in [_PendingImage.removeListener].
//      result.addListener(streamListener);
//    }
//    return result;
//  }
//
//  // 缓存检查，超过缓存限制则从缓存中移除最近最少使用的缓存项
//  void _checkCacheSize() {
//    while (
//        _currentSizeBytes > _maximumSizeBytes || _cache.length > _maximumSize) {
//      final Object key = _cache.keys.first;
//      final _CachedImage image = _cache[key];
//      _currentSizeBytes -= image.sizeBytes;
//      _cache.remove(key);
//    }
//    assert(_currentSizeBytes >= 0);
//    assert(_cache.length <= maximumSize);
//    assert(_currentSizeBytes <= maximumSizeBytes);
//  }
//}
//
//class _CachedImage {
//  _CachedImage(this.completer, this.sizeBytes);
//
//  final ImageStreamCompleter completer;
//  final int sizeBytes;
//}
//
//class _PendingImage {
//  _PendingImage(this.completer, this.listener);
//
//  final ImageStreamCompleter completer;
//  final ImageStreamListener listener;
//
//  void removeListener() {
//    completer.removeListener(listener);
//  }
//}
