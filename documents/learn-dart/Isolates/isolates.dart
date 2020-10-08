/// 隔离区
///
/// 大多数计算机中, 甚至在移动平台上, 都在使用多核 CPU. 为了有效利用多核性能,
/// 开发者一般使用共享内存的方式让线程并发地运行。然而, 多线程共享数据通常会导
/// 致很多潜在的问题, 并导致代码运行出错.
///
/// 为了解决多线程带来的并发问题, Dart 使用 isolates 替代线程, 所有的 Dart
/// 代码均运行在一个 isolates 中. 每一个 isolates 有它自己的堆内存以确保其
/// 状态不被其它 isolates 访问.
///
/// isolate 的 API 文档
/// https://api.dart.dev/stable/dart-isolate/dart-isolate-library.html
///
/// isolate 在接口请求时的应用
/// https://flutter.cn/docs/cookbook/networking/background-parsing
///
/// isolate 的事件循环机制
/// https://medium.com/dartlang/dart-asynchronous-programming-isolates-and-event-loops-bffc3e296a6a
