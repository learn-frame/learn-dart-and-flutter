/// 函数
///
/// 有箭头函数和普通函数两种, 声明函数时建议定义返回类型、
///
/// 支持可选参数, 可选参数分为命名参数和位置参数, 两者不能同时出现在参数列表中
/// 可选参数都支持默认值
///
/// 每个 Dart 程序都必须有一个 main() 顶级函数作为程序的入口, main() 函数返回值为
/// void 并且有一个 List<String> 类型的可选参数

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
void main() {
  const _nobleGases = [1, 2, 3];

  // 普通函数
  bool isNoble(int atomicNumber) {
    return _nobleGases[atomicNumber] != null;
  }

  // 箭头函数
  bool isNoble2(int atomicNumber) => _nobleGases[atomicNumber] != null;

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
  void sayAnything(String from, String msg, [String device, Animal animal]) {
    var result = '$from says $msg';
    if (device != null) {
      result = '$result with a $device';
    }
    print(result);
  }

  // 相对于命名参数, 位置参数更省代码, 但不如命名参数灵活
  sayAnything('Osaka', 'hi', 'iPhone');
}
