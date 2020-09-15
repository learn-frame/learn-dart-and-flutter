/// 构造函数
///
/// 默认构造函数: 如果你没有声明构造函数, 那么 Dart 会自动生成一个无参数
/// 的构造函数并且该构造函数会调用其父类的无参数构造方法

class Person {
  String firstName;
  String lastName;
  int age;

  // 和其他语言一样声明构造函数的语法
  // Person(String firstName, String lastName, int age) {
  //   this.firstName = firstName;
  //   this.lastName = lastName;
  //   this.age = age;
  // }

  // Dart 独有的语法糖
  Person(this.firstName, this.lastName, this.age);

  // 命名式构造函数
  // TODO: 子类不能继承父类的命名式构造函数, 如果你想在子类中提供一个与父类命名
  // 构造函数名字一样的命名构造函数, 则需要在子类中显式地声明
  Person.defaultPerson(String firstName) {
    firstName = firstName;
    lastName = 'Leo';
    age = 18;
  }
}

class Male extends Person {
  int incoming;

  Male(String firstName, String lastName, int age, this.incoming)
      : super(firstName, lastName, age);
}

void main(List<String> args) {
  // 当没有构造函数的时候, 你无法在创建实例时传入初始实例变量
  // 同时你无法继承其父类的实例变量, 因为 super 是写在构造函数中的
  // final person = Person();

  // 使用类的构造方法创建实例
  // final person = Person.defaultPerson('Sayaka');
}
