/// Map
///
/// Map 同样支持扩展运算符, Collection If 和 Collection For

void main() {
  // 通过 Map 字面量创建 Map
  var gifts = {
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings',
    0: 'Yancey',
    1: 'Leo',
  };

  // 通过 Map 的构造器创建 Map
  var nobleGases = Map();
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';
}
