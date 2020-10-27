/// 此外, 每个类都默认有一个 noSuchMethod 方法, 当你调用了不存在的方法或实例变量
/// 将会执行该方法, 你可以重写它. 注意你必须将对象设为 dynamic 类型, 才可以调用其一个
/// 不存在的方法或属性(因为如果你用 var / final / const 或者对象类型定义这个变量时,
/// 尝试获取不属于该变量的属性和方法将会直接报编译时错误)
///

class Piloted {
  int astronauts = 1;
  final _names = ['Yancey', 'Sayaka'];

  void describeCrew() {
    print('宇航员人数：$astronauts');
  }

  void noSuchMethod(Invocation invocation) {
    print('你尝试使用一个不存在的成员：' + '${invocation.memberName}');
  }
}

void main(List<String> args) {

  // 注意必须使用 dynamic 类型定义, 所以一般也不会用到该方法
  dynamic plioted = Piloted();
  print(plioted.fuck()); // 你尝试使用一个不存在的成员：Symbol("fuck")
  print(plioted.names); // 你尝试使用一个不存在的成员：Symbol("names")
}
