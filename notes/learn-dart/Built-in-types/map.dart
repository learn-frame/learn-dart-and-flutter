/// Map
///
/// Map 同样支持扩展运算符, Collection If 和 Collection For
/// Map 家族
/// - Map
/// - HashMap
/// - LinkedHashMap,
/// - SplayTreeMap(伸展树, 一种自平衡二叉查找树) https://zh.wikipedia.org/zh-hans/%E4%BC%B8%E5%B1%95%E6%A0%91

import 'dart:collection';

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

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  HashMap<String, String> hashMap = HashMap();
  hashMap['firstName'] = 'Yancey';
  hashMap.putIfAbsent('lastName', () => 'Leo');
  hashMap.update('name', (e) => e,
      ifAbsent: () => '${hashMap['firstName']} ${hashMap['lastName']}');

  // Get Value by Key
  print(hashMap['firstName']);

  // Get Map Size
  print(hashMap.length);

  // Check Key Existance
  print(hashMap.containsKey('name'));

  // Check Value Existance
  print(hashMap.containsValue('Yancey'));

  // Remove a Key (删除一个不存在的 key 不会报错)
  hashMap.remove('firstName');

  // Remove by Criteria
  hashMap
      .removeWhere((key, value) => key == 'name' || value == 'Sayaka Yamamoto');

  // Clear All Entries
  hashMap.clear();

  // Iterate Through a Map
  hashMap.forEach((key, value) {
    print('key: $key, value: $value');
  });

  // Map a Map
  hashMap.map((key, value) {
    return MapEntry(key, '$value mapped');
  });
}
