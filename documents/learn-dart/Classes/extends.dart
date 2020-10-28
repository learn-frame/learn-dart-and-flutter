/// 扩展一个类
///
/// 通过扩展一个类可以扩展父类的方法, 也可以重写类成员
///
/// 因为 Dart 中一切皆对象, 所以 Dart 中的运算符也可以被重写(骚)
/// 以下的运算符都能被重写
/// <,	+,	|,	[], >,	/,	^,	[]=, <=,	~/,	&,	~, >=,	*,	<<,	==, –,	%,	>>
/// 注意1. != 操作符并不是一个可被重写的操作符, 因为表达式 e1 != e2 仅仅是 !(e1 == e2) 的一个语法糖
/// 注意2. 如果重写 == 操作符，必须也同时重写对象 hashCode 的 Getter 方法
///
/// 重写 == 的例子可关注 https://dart.cn/guides/libraries/library-tour#implementing-map-keys

import 'basic_classes.dart';

class Orbiter extends Spacecraft {
  double altitude;
  Orbiter(String name, double side, DateTime launchDate, this.altitude)
      : super(name, side, launchDate);

  // 通过 super.describe(); 就继承了父类的 describe 方法, 你可以在子类里扩展该方法
  String describe() {
    // 这里可以扩展父类的 describe 方法
    super.describe();

    // 然后可以增加一些子类自己的业务...
    return '';
  }

  // 你也可以重写类成员
  // 子类可以重写父类的实例方法, Getter 以及 Setter 方法, 可以使用 @override 注解来表示重写了一个成员
  // TODO: 限定方法参数以及实例变量的类型可以让代码更加 类型安全，可以使用“协变关键字”
  @override
  set area(covariant double value) => 1.0;
}

// Vector 就重写了 + 和 -
class Vector {
  final int x, y;

  Vector(this.x, this.y);

  Vector operator +(Vector v) => Vector(x + v.x, y + v.y);
  Vector operator -(Vector v) => Vector(x - v.x, y - v.y);
}

void main() {
  final v = Vector(2, 3);
  final w = Vector(2, 2);

  assert(v + w == Vector(4, 5));
  assert(v - w == Vector(0, 1));
}
