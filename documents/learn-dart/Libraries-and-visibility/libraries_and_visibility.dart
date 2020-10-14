/// 库(Library)与可见性
///
/// TODO: 库(Library)可以通过包(Package)来创建,
/// 关于创建依赖库包可参考 https://dart.cn/guides/packages
///
/// - 如何组织库的源文件
/// - 如何使用 export 命令
/// - 何时使用 part 命令
/// - 何时使用 library 命令
/// - 如何使用倒入和导出命令实现多平台的库支持

// 导入整个库
import '../Classes/abstract_classes.dart';

// 导入库的某部分
import '../Classes/constructor.dart' show Spacecraft;

// 给导入的库设一个别名(Specifying a library prefix)
import '../Classes/spacecraft.dart' as classLib;

// 可以通过别名的方式来引入库里的成员
final spacecraft = classLib.Spacecraft('日狗', 0, DateTime.now());

// 延迟加载库
// 目前只有 dart2js 支持, 用法大致如下:
// import 'package:greetings/hello.dart' deferred as hello;

// Future greet() async {
//   await hello.loadLibrary();
//   hello.printGreeting();
// }
