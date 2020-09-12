/// 运算符
///
/// 支持常规的加减乘除, 除并取整(~/), 取模(%)
///
/// 支持自增自减(i++, i--, ++i, --i)
///
/// 支持 ==, !=, >, <, >=, <=
///
/// 支持类型判断运算符, as, is, is!
///
/// 在 Dart 中, 运算符也都是类, 它们可以被重写
///

import '../classes.dart';

void main() {
  // 在 Dart 中 null 和 null 是相等的, 注意和 JavaScript 区分
  print(null == null); // true

  // 两个 Map 的内容相同, 它们两个也是相等的, 注意和 JavaScript 区分
  const map1 = {'a': 1};
  const map2 = {'a': 1};
  print(map1 == map2); // true

  // 一些个别情况需要函数判断两个对象是否相等
  identical(map1, map2);

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  // 通过 as, is, is! 进行一些类型检查和类型断言
  var spacecraft = Spacecraft('', DateTime.now());

  // 类型断言
  (spacecraft as Spacecraft).describe();

  // 类型检查
  if (spacecraft is Spacecraft) {
    // do something...
  }

  if (spacecraft is! Spacecraft) {
    // do something...
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
}
