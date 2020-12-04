/// 隐式接口, 其实就是 implements
///
///

import './abstract_classes.dart';

class Person {
  final _name;

  Person(this._name);

  String greet(String who) => '你好，$who。我是$_name。';
}

// 实现多个类
class Impostor implements Person, Dog {
  @override
  // TODO: implement _name
  get _name => throw UnimplementedError();

  @override
  String greet(String who) {
    // TODO: implement greet
    throw UnimplementedError();
  }

  @override
  int age;

  @override
  int likePersonAge;

  @override
  String name;

  @override
  void bark() {
    // TODO: implement bark
  }
}
