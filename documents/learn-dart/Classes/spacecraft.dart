import 'dart:math';

class Spacecraft {
  // 声明实例变量, 所有未初始化的实例变量, 如 name 和 launchDate, 其值均为 null.
  //
  // 如果你在声明一个实例变量的时候就将其初始化(而不是在构造函数或其它方法中), 那么
  // 该实例变量的值就会在对象实例创建的时候被设置, 该过程会在构造函数以及它的初始化
  // 器列表执行前.
  String name;
  double side = 0;
  DateTime launchDate;
  final age = 1;

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  // 构造函数
  // 默认构造函数: 如果没有声明构造函数, 那么 Dart 会自动生成一个无参数的构造函数, 并且该构造函数会调用其父类的无参数构造方法
  // 构造函数不能被继承: 子类不会继承父类的构造函数, 如果子类没有声明构造函数, 那么只会有一个默认无参数的构造函数
  //

  // Dart 的语法糖, 可以更优雅在构造函数中为实例变量赋值
  Spacecraft(
    this.name,
    this.side,
    this.launchDate,
  );

  // 命名式构造函数
  // 因为构造函数不能被继承, 同理命名式构造函数也不会被继承
  // 如果要在子类中提供一个与父类命名构造函数名字一样的命名构造函数, 需要在子类中显式地声明
  // 下面这个“取消发射”的例子, 就是给 launchDate 设默认参数 null, 以方便 new 一个特定的实例, 很好
  Spacecraft.unlaunched(String name, double side)
      : this(
          name,
          side,
          null,
        );

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  // getter
  double get area => side * side;

  // setter
  set area(double value) => side = sqrt(value);

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  // 实例方法
  String describe() {
    if (launchDate != null) {
      final years = DateTime.now().difference(launchDate).inDays ~/ 365;
      return '宇宙飞船：$name 的发射时间：${launchDate?.year}年 ($years years ago)';
    } else {
      return '尚未发射';
    }
  }
}

void main() {
  // 创建实例
  final spacecraft = Spacecraft('Crew Dragon', 4, DateTime.parse('2019-01-01'));

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  /// 所有实例变量均会隐式地声明一个 Getter 方法,
  /// 非 final 类型的实例变量还会隐式地声明一个 Setter 方法

  // 获取实例变量
  print(spacecraft.name); // Crew Dragon
  print(spacecraft.age); // 1

  // 修改实例变量
  spacecraft.side = 2;
  // spacecraft.age = 2; // final 类型的变量没有 setter, 故不能被赋值

  // 调用实例方法
  print(spacecraft.describe()); // 宇宙飞船：Crew Dragon 的发射时间：2019年 (1 years ago)

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  // getter
  print(spacecraft.area); // 16.0
  // setter
  spacecraft.area = 25;
  // 在 area 被 set 成 25 后, side 也变成了 5.0
  print(spacecraft.side); // 5.0

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  // 可以使用 Object 对象的 runtimeType 属性在运行时获取一个对象的类型
  // 就类似于 JavaScript 中的 typeof, 来获取实例对象的类型
  print(spacecraft.runtimeType); // Spacecraft
}
