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
///
/// 此外, 每个类都默认有一个 noSuchMethod 方法, 当你调用了不存在的方法或实例变量
/// 将会执行该方法, 你可以重写它. 🔞 注意你必须将对象设为 dynamic 类型, 才可以调用其一个
/// 不存在的方法或属性(因为如果你用 var / final / const 或者对象类型定义这个变量时,
/// 尝试获取不属于该变量的属性和方法将会直接报编译时错误); 当然, 接收方具有静态类型，
/// 定义了未实现的方法（抽象亦可），并且接收方的动态类型实现了 noSuchMethod 方法且
/// 具体的实现与 Object 中的不同, 也可以使用 noSuchMethod 方法.
/// 不过私以为, 没什么卵用

import '../basic_classes.dart';

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

// Vector 重写了 + 和 -
class Vector {
  final int x, y;

  Vector(this.x, this.y);

  Vector operator +(Vector v) => Vector(x + v.x, y + v.y);
  Vector operator -(Vector v) => Vector(x - v.x, y - v.y);
}

class Piloted {
  int astronauts = 1;
  final _names = ['Yancey', 'Sayaka'];

  void describeCrew() {
    print('宇航员人数：$astronauts');
  }

  // 重写 noSuchMethod 方法
  void noSuchMethod(Invocation invocation) {
    print('你尝试使用一个不存在的成员：' + '${invocation.memberName}');
  }
}

void main() {
  final v = Vector(2, 3);
  final w = Vector(2, 2);

  assert(v + w == Vector(4, 5));
  assert(v - w == Vector(0, 1));

  // 重写 noSuchMethod 的示例, 注意变量必须用 dynamic 定义
  dynamic plioted = Piloted();
  print(plioted.fuck()); // 你尝试使用一个不存在的成员：Symbol("fuck")
  print(plioted.names); // 你尝试使用一个不存在的成员：Symbol("names")
}
