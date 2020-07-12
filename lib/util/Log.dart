/// 日志工具类
class Log{
  /// 日志开关
  static bool _debug = true;
  static info(String tag, String message){
      if(_debug) print("$tag：$message");
  }
}