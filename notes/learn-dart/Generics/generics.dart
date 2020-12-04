/// 泛型
///
/// 感觉没啥说的, 老子都会
///
import '../Classes/basic_classes.dart';

void main() {
  final firstNames = List<String>();
  firstNames.addAll(['Yancey', 'Sayaka']);
  // firstNames.add(1); // 出错, firstNames 只能接受字符串类型的参数

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  // 集合字面量
  var names = <String>['小芸', '小芳', '小民'];
  var uniqueNames = <String>{'小芸', '小芳', '小民'};
  var pages = <String, String>{
    'index.html': '主页',
    'robots.txt': '网页机器人提示',
    'humans.txt': '我们是人类，不是机器'
  };

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  // 使用类型参数化的构造函数
  var nameSet = Set<String>.from(names);
  var views = Map<int, Spacecraft>();

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  // 泛型集合以及它们所包含的类型
  var nickNames = List<String>();
  nickNames.addAll(['小芸', '小芳', '小民']);
  print(nickNames is List<String>); // true

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  // 泛型也可以用在函数上(返回值, 参数的类型, 局部变量的类型):
  // 更高阶的可参考: https://github.com/dart-lang/sdk/blob/master/pkg/dev_compiler/doc/GENERIC_METHODS.md
  T first<T>(List<T> ts) {
    // 处理一些初始化工作或错误检测……
    T tmp = ts[0];
    // 处理一些额外的检查……
    return tmp;
  }

  print(first<int>([1, 2, 3]));
}

// 使用类型参数化的构造函数
class Foo<T extends Spacecraft> {
  String toString() => "'Foo<$T>' 的实例";
}

class Extender extends Spacecraft {
  Extender(String name, double side, DateTime launchDate)
      : super(name, side, launchDate);
}

// 此时你就可以用类型化构造函数
var someBaseClassFoo = Foo<Spacecraft>();
var extenderFoo = Foo<Extender>();

// 如果不指定泛型类型, 默认使用初识定义的, 也就是 Foo<Spacecraft>
var foo = Foo();

// 将非 Spacecraft 的类型作为泛型参数则会导致编译错误
// var bar = Foo<Object>();
