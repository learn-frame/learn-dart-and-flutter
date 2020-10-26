/// Extends, 其实就是继承
///
import 'basic_classes.dart';

class Orbiter extends Spacecraft {
  double altitude;
  Orbiter(String name, double side, DateTime launchDate, this.altitude)
      : super(name, side, launchDate);

  String describe() {
    // 这里可以扩展父类的 describe 方法
    super.describe();

    // 增加 Orbiter 实现 describe 方法的一些逻辑...
    return '';
  }

  // 子类可以重写父类的实例方法, Getter 以及 Setter 方法, 可以使用 @override 注解来表示重写了一个成员
  // TODO: 限定方法参数以及实例变量的类型可以让代码更加 类型安全，你可以使用 协变关键字
  @override
  set area(covariant double value) => 1.0;
}

class Piloted {
  int astronauts = 1;
  void describeCrew() {
    print('宇航员人数：$astronauts');
  }
}
