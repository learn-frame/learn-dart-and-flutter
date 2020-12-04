/// 类变量和方法 (静态属性和静态方法)
///
/// 没什么好说的, 跟其他语言一样, 就是静态属性和静态方法, 贴两个注意点:
/// 1. 静态方法(即类方法)不能被一个类的实例访问
/// 2. 同样地, 静态方法内也不可以使用 this

import 'dart:math';

class Point {
  double x, y;
  Point(this.x, this.y);

  static int num = 1;

  static double distanceBetween(Point a, Point b) {
    var dx = a.x - b.x;
    var dy = a.y - b.y;
    return sqrt(dx * dx + dy * dy);
  }
}

void main() {
  var a = Point(2, 2);
  var b = Point(4, 4);
  var distance = Point.distanceBetween(a, b);
  assert(2.8 < distance && distance < 2.9);
  print(distance);
}
