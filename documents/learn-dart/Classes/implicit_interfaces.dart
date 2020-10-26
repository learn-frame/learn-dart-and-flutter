/// 隐式接口, 其实就是 implements
///
///

class Person {
  final _name;

  Person(this._name);

  String greet(String who) => '你好，$who。我是$_name。';
}

class Impostor implements Person {
  @override
  // TODO: implement _name
  get _name => throw UnimplementedError();

  @override
  String greet(String who) {
    // TODO: implement greet
    throw UnimplementedError();
  }
}
