/// 测试函数是否相等

void foo() {} // A top-level function

class A {
  static void bar() {} // 定义静态方法
  void baz() {} // 定义实例方法
}

void main() {
  var x;

  // 比较顶层函数是否相等
  x = foo;
  print(foo == x); // true

  // 比较静态方法是否相等
  x = A.bar;
  print(A.bar == x); // true

  // 比较实例方法是否相等
  var a1 = A(); // A 的实例 a1
  var a2 = A(); // A 的实例 a2
  var y = a2;
  x = a2.baz;

  // 此时 y.baz 跟 x 指向同一个实例对象, 因此它们相等
  print(y.baz == x); // true
  //
  // 这两个闭包引用了不同的实例对象, 因此它们不相等
  print(a1.baz == a2.baz); // false
}
