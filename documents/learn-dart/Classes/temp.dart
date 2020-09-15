/* 
* Class
*/

// 1. 创建类的实例可以不用 new
// 2.

/* 
* Getter 和 Setter
 */
class GetterSetter {
  int _aProperty = 0;

  static const List<int> _values = [];

  // getter 可用来定义计算属性
  int get count {
    return _values.length;
  }

  // getter
  int get aProperty => _aProperty;

  // setter
  set aProperty(int value) {
    if (value >= 0) {
      _aProperty = value;
    }
  }
}

void main() {
  var voyager = new Spacecraft('旅行者一号', DateTime(1977, 9, 5));
  voyager.describe();

  var voyager3 = new Spacecraft.unlaunched('旅行者三号');
  voyager3.describe();
}

class Spacecraft {
  String name;
  DateTime launchDate;

  // 构造函数
  Spacecraft(this.name, this.launchDate) {
    // 这里可以实现初始化代码
  }

  // 命名构造函数，转发到默认构造函数
  Spacecraft.unlaunched(String name) : this(name, null);

  // getter, 只读的非 final 的属性
  int get launchYear => launchDate?.year;

  // 实例方法
  void describe() {
    print('宇宙飞船：$name');
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('发射时间：$launchYear ($years years ago)');
    } else {
      print('尚未发射');
    }
  }
}

// 继承
class Orbiter extends Spacecraft {
  double altitude;
  Orbiter(String name, DateTime launchDate, this.altitude)
      : super(name, launchDate);
}

class Piloted {
  int astronauts = 1;
  void describeCrew() {
    print('宇航员人数：$astronauts');
  }
}

// Mixin
class PilotedCraft extends Spacecraft with Piloted {
  double altitude;
  PilotedCraft(String name, DateTime launchDate, this.altitude)
      : super(name, launchDate);
}

// dart 没有 interface 关键字, 所有的类都隐式定义了一个接口. 因此, 任意类都可以作为接口被实现.
class MockSpaceship implements Spacecraft {
  @override
  DateTime launchDate;

  @override
  String name;

  @override
  void describe() {
    // TODO: implement describe
  }

  @override
  // TODO: implement launchYear
  int get launchYear => throw UnimplementedError();
}
