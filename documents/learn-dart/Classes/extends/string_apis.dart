/// To create a local extension that’s visible only in the library where it’s
/// declared, either omit the extension name or give it a name that starts
/// with an underscore (_).

/// The members of the extension can be methods, getters, setters, operators.
/// Extensions can also have static fields and static helper methods.

// 通过 extension 扩展了 String 类
extension NumberParsing on String {
  // 给字符串新增一个 parseInt 方法
  int parseInt() {
    return int.parse(this);
  }
}
