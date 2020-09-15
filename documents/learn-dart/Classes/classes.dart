import 'dart:math';

/// 类
///

class Spacecraft {
  String name; // 宇宙飞船名
  double side; // 边长
  DateTime launchDate; // 发射时间

  // 构造函数
  Spacecraft(
    this.name,
    this.side,
    this.launchDate,
  ) {
    // 这里可以实现初始化代码
  }

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

void main(List<String> args) {
  final spacecraft =
      new Spacecraft('Crew Dragon', 4, DateTime.parse('2019-01-01'));

  print(spacecraft.instanceVarible); // 实例变量
  print(spacecraft.describe()); // 实例方法

  print(spacecraft.area); // getter
  spacecraft.area = 25; // setter

  print(spacecraft.side); // 5
}
