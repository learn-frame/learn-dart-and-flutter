/// 抽象类
///
/// 实例方法, Getter 方法以及 Setter 方法都可以是抽象的, 抽象类只定义接口, 并将其实现留给其他类
/// 注意抽象类无法被实例化, 但可以通过为其定义工厂构造函数, 来被实例化(有意思啊?)

abstract class Describable {
  void describe();

  void describeWithEmphasis() {
    print('=========');
    describe();
    print('=========');
  }
}
