/// Mixin 是一种在多重继承中复用某个类中代码的方法模式

import 'basic_classes.dart';

class Piloted {
  int astronauts = 1;
  void describeCrew() {
    print('宇航员人数：$astronauts');
  }
}

// Mixin
class PilotedCraft extends Spacecraft with Piloted {
  double altitude;
  PilotedCraft(String name, double side, DateTime launchDate, this.altitude)
      : super(name, side, launchDate);
}

// dart 没有 interface 关键字, 所有的类都隐式定义了一个接口.
// 因此, 任意类都可以作为接口被实现.
class MockSpaceship implements Spacecraft {
  @override
  double area;

  @override
  DateTime launchDate;

  @override
  String name;

  @override
  double side;

  @override
  // TODO: implement age
  int get age => throw UnimplementedError();

  @override
  String describe() {
    // TODO: implement describe
    throw UnimplementedError();
  }
}
