/// Dart 支持两种 Number 类型, 分别是 int 和 double
///
/// int 最大长度不超过 64 位, DartVM 上取值位于 -2^63 至 2^63 - 1, 如果编译
/// 成 JavaScript 就是 -2^53 至 2^53 - 1.
///
/// double 为 64 位的双精度浮点数字, 且符合 IEEE 754 标准
///
/// 对于一些数学运算, 你可以查看 dart:math 库中的 API
/// https://api.dart.dev/stable/dart-math/dart-math-library.html

// 导入整个库
// import 'dart:math'

// show 关键组表示只导入库的某一部分
import 'dart:math' show max, Random;

void main() {
  // int 的属性和方法可参考
  // https://api.dart.dev/stable/dart-core/int-class.html
  final intNum = -100;
  intNum.abs();
  intNum.toString();
  intNum.isEven;

  // 也可以定义其他进制的整数
  int hex = 0xDEADBEEF;

  // double 的属性和方法可参考
  // https://api.dart.dev/stable/dart-core/double-class.html
  final doubleNum = 100.1;
  doubleNum.toInt();
  doubleNum.toString();
  doubleNum.isInfinite;

  // 将 int 类型的数字定义成 double 类型, 该变量会被转换成 double 类型
  double z = 1; // z 变成了 1.0

  // 字符串和数字类型之间的转换
  int.parse('1');
  double.parse('1.1');
  1.toString();
  3.14159.toStringAsFixed(2);

  // int 类型的数字可以使用一些位运算符
  assert((3 << 1) == 6); // 0011 << 1 == 0110
  assert((3 >> 1) == 1); // 0011 >> 1 == 0001
  assert((3 | 4) == 7); // 0011 | 0100 == 0111

  // 使用 Math 库
  Random randomNum = new Random(hex);
  print(randomNum.nextInt(100));

  var maxInt = max(10, 20);
  print(maxInt);
}
