import 'dart:math';

class Spacecraft {
  // 声明实例变量, 所有未初始化的实例变量, 如 name 和 launchDate, 其值均为 null

  // 如果你在声明一个实例变量的时候就将其初始化(而不是在构造函数或其它方法中)
  // 那么该实例变量的值就会在对象实例创建的时候被设置,
  // 该过程会在构造函数以及它的初始化器列表执行前.
  String name;
  double side = 0;
  DateTime launchDate;
  final age = 1;

  // Dart 的语法糖, 可以更优雅初始化构造函数
  Spacecraft(
    this.name,
    this.side,
    this.launchDate,
  );

  // 命名构造函数，转发到默认构造函数
  Spacecraft.unlaunched(String name, double side)
      : this(
          name,
          side,
          null,
        );

  // getter
  double get area => side * side;

  // setter
  set area(double value) => side = sqrt(value);

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
