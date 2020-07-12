


/// 异步任务的状态
/// AsyncSnapshot 包含异步任务状态以及异步任务的结果
enum ConnectionState {
  /// 表示没有任何异步任务，如FutureBuilder的future属性为null
  none,

  /// 表示异步任务还未交互，此时可以显示加载动画
  waiting,

  /// 表示一个活跃的异步任务，如Stream还在传输数据还未结束的时候，此时可以显示加载动画
  active,

  /// Connected to a terminated asynchronous computation.
  /// 表示异步任务执行结束，一般在此状态下获取异步任务执行结果
  done,
}