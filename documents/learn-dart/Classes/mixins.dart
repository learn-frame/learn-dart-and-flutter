/// Mixin 是一种在多重继承中复用某个类中代码的方法模式, 其通过使用 with 关键字并
/// 在其后跟上 Mixin 类的名字来使用 Mixin 模式

class Piloted {
  int astronauts = 1;
  void describeCrew() {
    print('宇航员人数：$astronauts');
  }
}

// Mixin
class PilotedCraft with Piloted {
  double altitude;
  PilotedCraft(this.altitude);
}

// 定义一个类继承自 Object 并且不为该类定义构造函数, 这个类就是 Mixin 类
// 通过使用关键字 mixin 替代 class 让其成为一个单纯的 Mixin 类
mixin Musical {
  bool canPlayPiano = false;
  bool canCompose = false;
  bool canConduct = false;

  void entertainMe() {
    if (canPlayPiano) {
      print('Playing piano');
    } else if (canConduct) {
      print('Waving hands');
    } else {
      print('Humming to self');
    }
  }
}

// 可以使用关键字 on 来指定哪些类可以使用该 Mixin 类
// 下面这个例子中, 只有继承或实现 Musician 类, 才能使用 MusicalPerformer 这个 mixin
// 因此 SingerDancer 必须要继承或实现 Musician 类, 才能混入 MusicalPerformer,
class Musician {
  // ...
}

mixin MusicalPerformer on Musician {
  // ...
}

// 如果不继承或实现 Musician, 则报错:
// 'MusicalPerformer' can't be mixed onto 'Object' because 'Object' doesn't implement 'Musician'.
// Try extending the class 'MusicalPerformer'.
class SingerDancer extends Musician with MusicalPerformer {
  // ...
}
