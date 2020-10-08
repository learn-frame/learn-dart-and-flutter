/// 元数据
///
/// 元数据注解以 @ 开头, 其后紧跟一个编译时常量(比如 deprecated)
/// 或者调用一个常量构造函数.

import 'todo_metadata.dart';

/// Dart 内置两个注解, 分别是 @deprecated 和 @override
class Television {
  /// _弃用: 使用 [turnOn] 替代_
  @deprecated
  void activate() {
    turnOn();
  }

  /// 打开 TV 的电源。
  void turnOn() {
    print('open tv');
  }

  @override
  void someMethod() {}
}

// 使用自定义的注解
// 如下是调用常量构造函数的方式
@Todo('seth', 'make this do something')
void doSomething() {
  print('do something');
}

// 使用自定义的注解
// 如下是使用编译时常量的方式
const Todo todo = Todo('seth', 'make this do something');
@todo
void doSomething1() {
  print('do something');
}
