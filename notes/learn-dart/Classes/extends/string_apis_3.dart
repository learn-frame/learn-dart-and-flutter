// 通过 extension 扩展了 String 类
extension NumberParsing on String {
  // 给字符串新增一个 parseInt 方法
  int parseInt() {
    return int.parse(this);
  }

  // 给字符串新增一个 parseDouble 方法
  double parseDouble() {
    return double.parse(this);
  }
}
