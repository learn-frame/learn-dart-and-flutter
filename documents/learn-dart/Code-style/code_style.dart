/// 代码风格:
///
/// [类名, 枚举类型, 类型定义, 类型参数, 扩展名]都要用(首字母大写的驼峰命名)
/// [注解名如果有参数], 必须使用(首字母大写的驼峰命名), 如果[注解没参数], 可用(首字母小写的驼峰命名)
/// [库, 包, 文件夹, 源文件]使用(小写字母和下划线的命名法)
/// [类成员, 顶级定义, 变量, 参数, 命名参数]使用(首字母小写的驼峰命名)
/// [常量]使用(首字母小写的驼峰命名) 🔞: 不建议使用全大写加下划线的命名法
/// 比如 HttpConnection 不要命名成 HTTPConnection

/// 导入导出顺序: dart 官方库 > 三方库 > 自己的文件 > 导出
// import 'dart:html';
// import 'package:bar/bar.dart';
// import 'package:foo/foo.dart'; // 要按照字母顺序, 比如先引入 bar, 再引入 foo
// import 'util.dart';
// export 'src/error.dart';

/// 在控制台执行 dartfmt 来格式化代码
/// 避免单行超过 80 个字符
/// 流程控制结构应使用花括号, 除了这种单行结构 if (arg == null) return defaultValue;

/// 所有注释使用 // .... 的形式, /* ... */ 只是用来注释掉一段代码
///
/// 写文档时增加 example 也是不错的选择:
/// Returns the lesser of two numbers.
///
/// ```dart
/// min(5, 3) == 3
/// ```
///
/// 使用方括号在文档注释中引用作用域内的标识符:
/// Throws a [StateError] if ...
/// similar to [anotherMethod()], but ...
/// 关于文档方面可参考: https://dart.cn/guides/language/effective-dart/documentation

void main(List<String> args) {
  // 使用相邻字符串的方式连接字面量字符串
  print('ERROR: Parts of the spaceship are on fire. Other '
      'parts are overrun by martians. Unclear which are which.');

  // list, map, queue, set 使用集合字面量即可
  var points = <String>[];
  var addresses = <String, String>{};
  var counts = <int>{};

  // 不必再声明 List, Map, Set 等
  var _points = List<String>();
  var _addresses = Map<String, String>();
  var _counts = Set<int>();

  // 使用 [].isEmpty; 来判断集合是否为空, 而不是使用 [].length == 0;
}
