/// 常量构造函数
///
/// 如果类生成的对象都是不会变的, 那么可以在生成这些对象时就将其变为编译时常量.
/// 你可以在类的构造函数前加上 const 关键字并确保所有实例变量均为 final 来实现该功能

class ImmutablePoint {
  static final ImmutablePoint origin = const ImmutablePoint(0, 0);

  final double x, y;

  const ImmutablePoint(this.x, this.y);
}

void main(List<String> args) {
  var a = const ImmutablePoint(1, 1);
  var b = const ImmutablePoint(1, 1);
  assert(identical(a, b)); // 它们是同一个实例

  var c = ImmutablePoint.origin;
  print(c.x); // 0.0
}
