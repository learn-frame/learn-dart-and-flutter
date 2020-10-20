/// 枚举
///
/// 枚举类的限制:
/// 1. 枚举不能成为子类, 也不可以 mixin
/// 2. 不能显式地实例化一个枚举类
/// 3. Dart 的枚举没 TS 的骚了, 只能 0, 1, 2, 3....

enum Color { red, green, blue }

void main(List<String> args) {
  // 使用枚举的 index 属性来获取每个元素的枚举值
  print(Color.red.index); // 0
  print(Color.green.index); // 1
  print(Color.blue.index); // 2

  // 使用枚举的 values 属性将枚举转换为 List 类型
  List<Color> colors = Color.values;
  print(colors); // [Color.red, Color.green, Color.blue]

  // 也可以跟 switch...case 配合
  var aColor = Color.blue;
  switch (Color.blue) {
    case Color.red:
      print('红如玫瑰！');
      break;
    case Color.green:
      print('绿如草原！');
      break;
    default: // 没有该语句会出现警告。
      print(aColor); // 'Color.blue'
  }
}
