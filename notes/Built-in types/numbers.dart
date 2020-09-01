/// Dart 支持两种 Number 类型, 分别是 int 和 double
///
/// int 最大长度不超过 64 位, DartVM 上取值位于 -2^63 至 2^63 - 1, 如果编译
/// 成 JavaScript 就是 -2^53 至 2^53 - 1.
///
/// double 为 64 位的双精度浮点数字, 且符合 IEEE 754 标准

void main() {
  // int 的属性和方法可参考
  // https://api.dart.dev/stable/dart-core/int-class.html
  final intNum = -100;
  intNum.abs();
  intNum.toString();
  intNum.isEven;

  // double 的属性和方法可参考
  // https://api.dart.dev/stable/dart-core/double-class.html
  final doubleNum = 100.1;
  doubleNum.toInt();
  doubleNum.toString();
  doubleNum.isInfinite;

  /// TODO: 除了加减乘除和一些内置属性方法, 它们还可以使用一些位运算
  ///
  /// 对于一些数学运算, 你还可以查看 dart:math 库中的 API
  /// https://api.dart.dev/stable/dart-math/dart-math-library.html
}
