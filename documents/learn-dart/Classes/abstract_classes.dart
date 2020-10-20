// 抽象类
// 实例方法、Getter 方法以及 Setter 方法都可以是抽象的, 抽象类只定义接口，并将其实现留给其他类
// 抽象类无法被实例化

abstract class Describable {
  void describe();

  void describeWithEmphasis() {
    print('=========');
    describe();
    print('=========');
  }
}
