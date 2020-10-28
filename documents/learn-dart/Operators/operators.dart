/// 运算符
///
/// 常规的加减乘除, 除并取整(~/), 取模(%)
///
/// 自增自减(i++, i--, ++i, --i)
///
/// ==, !=, >, <, >=, <=
///
/// 类型判断运算符, as, is, is!
///
/// 赋值运算符, =, +=, -=, *=, /=, ~/=, %=, ^=, >>=, <<=, &=, |=, ??=
///
/// 逻辑运算符, !, &&, ||, 🔞 注意 Dart 使用逻辑运算符, 双方必须是 boolean 类型
///
/// 支持位运算符
///
/// 条件表达式, 有 condition ? expr1 : expr2 和 expr1 ?? expr2 两种
///
/// 级联运算符
///
/// TODO: 在 Dart 中, 运算符也都是类, 它们可以被重写
///

import 'dart:html';
import '../Classes/basic_classes.dart';

void main() {
  // 在 Dart 中 null 和 null 是相等的, 🔞 注意和 JavaScript 区分
  print(null == null); // true

  // 两个 Map 的内容相同, 它们两个也是相等的, 🔞 注意和 JavaScript 区分
  const map1 = {'a': 1};
  const map2 = {'a': 1};
  print(map1 == map2); // true

  // 一些个别情况需要函数判断两个对象是否相等
  identical(map1, map2);

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  // 通过 as, is, is! 进行一些类型检查和类型断言
  var spacecraft = Spacecraft('', 44, DateTime.now());

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

  // 赋值运算符
  dynamic a = map1;
  a &= map2; // 等价于 a = a & map2
  a |= map2; // 等价于 a = a | map2

  // 当且仅当 b 为 null 时才赋值
  var b;
  b ??= map2;

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  // 逻辑运算符
  // 🔞 注意 Dart 使用逻辑运算符, 双方必须是 boolean 类型
  // 不存在像 JavaScript 一样的类型转换
  const done = false;
  const col = 1;

  if (!done && (col == 0 || col == 3)) {
    // do something...
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  // &	       按位与
  // |	       按位或
  // ^	       按位异或
  // ~表达式	 按位取反（即将 “0” 变为 “1”，“1” 变为 “0”）
  // <<	      位左移
  // >>	      位右移

  final value = 0x22;
  final bitmask = 0x0f;

  assert((value & bitmask) == 0x02); // 按位与 (AND)
  assert((value & ~bitmask) == 0x20); // 取反后按位与 (AND NOT)
  assert((value | bitmask) == 0x2f); // 按位或 (OR)
  assert((value ^ bitmask) == 0x2d); // 按位异或 (XOR)
  assert((value << 4) == 0x220); // 位左移 (Shift left)
  assert((value >> 4) == 0x02); // 位右移 (Shift right)

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  // 条件表达式

  dynamic foo() {
    // 标准的三目运算符
    // 这里的 done 必须是 boolean 类型
    return done ? '' : 1;
  }

  dynamic bar() {
    // 如果表达式 1 为非 null 则返回其值, 否则执行表达式 2 并返回其值
    // 这里的 col 可以不是 boolean 类型
    return col ?? '';
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  // 级联运算符
  querySelector('#confirm') // 获取对象 (Get an object).
    ..text = 'Confirm' // 使用对象的成员 (Use its members).
    ..classes.add('important')
    ..onClick.listen((e) => window.alert('Confirmed!'));

  // 级联运算符等价于下面的操作, 其实就类似于 jQuery 的链式调用
  var button = querySelector('#confirm');
  button.text = 'Confirm';
  button.classes.add('important');
  button.onClick.listen((e) => window.alert('Confirmed!'));

  // 下面这种玩法就不行, 因为 sb.write 返回的是 void, 而非 sb 本身
  // var sb = StringBuffer();
  // sb.write('foo')
  //   ..write(
  //       'bar');

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  // 其他运算符: 条件访问成员(?.)
  String sayAnything({String str}) {
    return str?.toLowerCase();
  }
}
