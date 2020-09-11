/// 函数
///
/// 有箭头函数和普通函数两种, 声明函数时建议定义返回类型、
///
/// 支持可选参数, 可选参数分为命名参数和位置参数, 两者不能同时出现在参数列表中
/// 可选参数都支持默认值, 默认值必须是编译时常量, 没有指定默认值的情况下默认值为 null
///
/// 每个 Dart 程序都必须有一个 main() 顶级函数作为程序的入口, main() 函数返回值为
/// void 并且有一个 List<String> 类型的可选参数
///
/// Dart 中的函数作为一等对象(公民), 可以将函数作为参数传递给另一个函数,
/// 也可以将函数赋值给一个变量, Dart 支持匿名函数
///
/// Dart 是词法有作用域语言, 变量的作用域在写代码的时候就确定了
/// 大括号内定义的变量只能在大括号内访问
///
/// 所有的函数都有返回值, 没有写返回值的函数(void)类型, 默认会执行 `return null`;
///
/// 此外, 你还可以测试两个函数是否相等(在另外一个文件)

import 'package:meta/meta.dart';

class Animal {
  String name;
  int age;

  Animal(this.name, this.age) {
    this.name = name;
    this.age = age;
  }

  say() {
    print('I\'m $this.name');
  }
}

// 每个 Dart 程序都必须有一个 main() 顶级函数作为程序的入口,
// main() 函数返回值为 void 并且有一个 List<String> 类型的可选参数
void main(List<String> arguments) {
  // main 函数自带一个 List<String> 类型的可选参数
  print(arguments);

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  const _nobleGases = [1, 2, 3];

  // 普通函数
  bool isNoble(int atomicNumber) {
    return _nobleGases[atomicNumber] != null;
  }

  // 箭头函数
  bool isNoble2(int atomicNumber) => _nobleGases[atomicNumber] != null;

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  // 可选参数之 - 命名参数
  void enableFlagsNamed(String requiredParam,
      {int bold, bool hidden, @required Animal animal}) {
    print('$requiredParam $bold $hidden $animal');
  }

  // 可选参数之 - 命名参数需要这样调用
  // {} 中的三个参数都是可选的, 比如你可以不传入 content 这个参数
  // 即便如此, 你也可以给参数加上 @required 的注解
  // TODO: 此时调用函数会报 warning, 但不会影响运行
  enableFlagsNamed('', bold: 500, hidden: false, animal: Animal('Husky', 18));

  // 可选参数之 - 位置参数
  void sayAnything(String from, String msg,
      // 可选参数支持默认值, 默认值必须是编译时常量,
      // 没有指定默认值的情况下默认值为 null
      [String device = '',
      // List / Map / Set 也支持默认值, 只要将他们设为编译时常量即可
      List<int> list = const [1, 2, 3],
      Set<int> set = const {1, 2, 3},
      Map<int, int> map = const {1: 1, 2: 2, 3: 3},
      Animal animal]) {
    var result = '$from says $msg';
    if (device != null) {
      result = '$result with a $device';
    }
    print(result);
  }

  // 相对于命名参数, 位置参数更清爽, 但顺序不可调换
  sayAnything('Osaka', 'hi', 'iPhone');

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  // Dart 中的函数做为一级对象(一等公民), 即可以当作参数传递给另一个函数
  void printElement(int element) {
    print(element);
  }

  // 将 printElement 函数作为参数传递
  [1, 2, 3].forEach(printElement);

  // 也可以将函数传给一个变量
  final loudify = (String msg) => '!!! ${msg.toUpperCase()} !!!';
  print(loudify('hello'));

  // 支持匿名函数
  [1, 2, 3].forEach((element) => {print(element)});

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  // Dart 是词法有作用域语言, 变量的作用域在写代码的时候就确定了
  // 大括号内定义的变量只能在大括号内访问
  // nestedFunction 函数可以访问本文件的所有变量
  bool topLevel = true;
  var insideMain = true;

  void myFunction() {
    var insideFunction = true;

    void nestedFunction() {
      var insideNestedFunction = true;

      assert(topLevel);
      assert(insideMain);
      assert(insideFunction);
      assert(insideNestedFunction);
    }
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  // 闭包即一个函数对象, 即使函数对象的调用在它原始作用域之外
  // 依然能够访问在它词法作用域内的变量.

  // 返回一个将 [addBy] 添加到该函数参数的函数
  Function makeAdder(int addBy) {
    return (int i) => addBy + i;
  }

  print(makeAdder(2)(3)); // 5
  print(makeAdder(4)(5)); // 9

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  // 所有的函数都有返回值, 没有写返回值的函数(void)类型, 默认会执行 `return null`;
  foo() {}
  assert(foo() == null);
}
