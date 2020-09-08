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

  gifts['one'] = 'hello'; // 向 map 中添加一个键值对
  gifts['one']; // 从 map 获取一个值, 当取不到时, 返回 null
  gifts.length; // 获取 map 的长度

  // 可通过在 Map 字面量前添加 const 关键字创建一个 Map 编译时常量
  // 此时的 constantMap 将不能使用 add / addAll 等方法
  final constantMap = const {
    'first': 'partridge',
    'second': 'turtledoves',
  };

  // Unsupported operation: Cannot change unmodifiable map
  // constantMap['first'] = 'money';
}
