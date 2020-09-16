import 'dart:math';

/// 类
///

class Spacecraft {
  /* 
  所有实例变量均会隐式地声明一个 Getter 方法,
  非 final 类型的实例变量还会隐式地声明一个 Setter 方法
  因此对于 name, side, launchDate, 你可以获取到这些变量, 并给它们 set 值
   */

  /* 
  TODO:
  如果你在声明一个实例变量的时候就将其初始化(而不是在构造函数或其它方法中), 
  那么该实例变量的值就会在对象实例创建的时候被设置, 该过程会在构造函数以及
  它的初始化器列表执行前
    */
  String name; // 声明 String  name 并初始化为 null
  double side = 0; // 声明 double 类型的变量 side 并初始化为 0
  DateTime launchDate; // 声明 DateTime 类型的变量 launchDate 并初始化为 null

  // Dart 声明构造函数的方式与传统 OOP 语言不同, 不使用
  // constructor 关键字, 而是声明一个与类名一样的函数
  // Spacecraft(
  //   String name,
  //   double side,
  //   DateTime launchDate,
  // ) {
  //   this.name = name;
  //   this.side = side;
  //   this.launchDate = launchDate;
  // }

  // Dart 的语法糖, 优雅创建构造函数
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

  // 实例变量
  int instanceVarible = 1;

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
  final spacecraft = Spacecraft('Crew Dragon', 4, DateTime.parse('2019-01-01'));

  // 用 ?. 避免左边为 null 的情况
  print(spacecraft?.instanceVarible); // 1

  // 调用实例变量(因为对于非 final 的实例变量, Dart 默认给它一个 getter)
  print(spacecraft.instanceVarible); // 2
  // 修改实例变量(因为对于非 final 的实例变量, Dart 默认给它一个 setter)
  spacecraft?.instanceVarible = 2;

  // 调用实例方法
  print(spacecraft.describe()); // 宇宙飞船：Crew Dragon 的发射时间：2019年 (1 years ago)

  // getter
  print(spacecraft.area); // 16.0
  // setter
  spacecraft.area = 25;
  // 在 area 被 set 成 25 后, side 也变成了 5.0
  print(spacecraft.side); // 5.0

  // 获取 spacecraft 运行时是什么类型
  print(spacecraft.runtimeType); // Spacecraft
}
