/// 构造函数
/// 在 Dart 中, 声明一个与类名一样的函数即可声明一个构造函数
///
/// 默认构造函数: 如果你没有声明构造函数, 那么 Dart 会自动生成一个无参数的构造函数
/// 并且该构造函数会调用其父类的无参数构造方法
///
/// 构造函数不被继承: 子类不会继承父类的构造函数, 如果子类没有声明构造函数, 那么只
/// 会有一个默认无参数的构造函数
///
/// 在 Dart 2.x 后可以不用使用 new 来创建实例, this 也基本上都省了(当且仅当命名
/// 冲突时使用 this 关键字才有意义，否则 Dart 会忽略 this 关键字)

class Person {
  String firstName;
  String lastName;
  int age;

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  // 无参数的构造函数:
  // 如果没有声明构造函数, 那么 Dart 会自动生成一个无参数的构造函数
  // 并且该构造函数会调用其父类的无参数构造方法

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  // 创建构造函数的普通形态
  // Person(String firstName, String lastName, int age) {
  //   this.firstName = firstName;
  //   this.lastName = lastName;
  //   this.age = age;
  // }

  // Dart 独有的语法糖来声明构造函数
  Person(this.firstName, this.lastName, this.age);

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  // 命名式构造函数
  // 下面这个 comingOfAgeCeremony(成人礼)的例子, 就是给 age 设默认参数 18, 以
  // 方便 new 一个特定的实例.
  Person.comingOfAgeCeremony(String firstName, String lastName) {
    firstName = firstName;
    lastName = lastName;
    age = 18;
  }
}

// 子类调用父类非默认构造函数的顺序:
// 1.初始化列表
// 2.父类的无参数构造函数
// 3.当前类的无参数构造函数
class Male extends Person {
  int incoming;

  // 继承: 子类调用父类的普通构造函数
  Male(String firstName, String lastName, int age, this.incoming)
      : super(firstName, lastName, age);

  // 继承: 子类调用父类的一个命名构造函数
  // Male(String firstName, String lastName, int age, this.incoming)
  //     : super.comingOfAgeCeremony(firstName, lastName);

  // 因为构造函数不能被继承, 同理命名式构造函数也不会被继承, 如果要在子类
  // 中提供一个与父类命名构造函数名字一样的命名构造函数, 需要在子类中显式地声明
  Male.comingOfAgeCeremony(String firstName, String lastName)
      : super.comingOfAgeCeremony(firstName, lastName) {
    // do something...
  }
}

void main(List<String> args) {
  // 当没有构造函数的时候, 你无法在创建实例时传入初始实例变量
  // 同时你无法继承其父类的实例变量, 因为 super 是写在构造函数中的
  // final person = Person();

  // 使用类的构造方法创建实例
  // final person = Person.defaultPerson('Sayaka');
}
