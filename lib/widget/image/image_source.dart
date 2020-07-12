// BoxFit
enum BoxFit1 {
  /// 填充目标容器，但是可能会被拉伸变形
  fill,

  /// 尽可能大的填充目标容器，不会被拉伸可能会有留白
  contain,

  /// 尽可能小的填充目标容器，图片的一部分可能看不到
  cover,

  /// 确保水平方向上充满目标容器
  fitWidth,

  /// 确保竖直方向上充满目标容器
  fitHeight,

  /// 不对图片做任何重设大小操作
  none,

  /// 如果图片较大，则和contain效果一样，否则和none效果一样
  scaleDown,
}