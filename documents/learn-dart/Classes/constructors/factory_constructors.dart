/// 工厂构造函数
///
/// 使用 factory 关键字标识类的构造函数将会令该构造函数变为工厂构造函数,
/// 这将意味着使用该构造函数构造类的实例时并非总是会返回新的实例对象.
///
/// 在工厂构造函数中无法访问 this

class Logger {
  final String name;
  bool mute = false;

  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }

  factory Logger.fromJson(Map<String, Object> json) {
    return Logger(json['name'].toString());
  }

  Logger._internal(this.name);

  void log() {
    print(_cache);
  }
}

void main(List<String> args) {
  // 工厂构造函数在使用上跟普通构造函数无异

  final log1 = Logger('UI');
  log1.log(); // {UI: Instance of 'Logger'}

  final log2 = Logger.fromJson({'name': 'FE'});
  // 可以看到 'UI' 和 'FE' 被缓存了下来
  log2.log(); // {UI: Instance of 'Logger', FE: Instance of 'Logger'}
  log1.log(); // {UI: Instance of 'Logger', FE: Instance of 'Logger'}
}

/// Tips:
/// putIfAbsent 是 Map 的一个方法, 它只会往 map 中新增不存在的 key, 而不会覆盖已有 key
/// 文档可戳: https://api.dart.dev/stable/dart-core/Map/putIfAbsent.html

class Square extends Shape {}

class Circle extends Shape {}

class Shape {
  Shape();

  factory Shape.fromTypeName(String typeName) {
    if (typeName == 'square') return Square();
    if (typeName == 'circle') return Circle();

    print('I don\'t recognize $typeName');
    return null;
  }
}
