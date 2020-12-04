/// Sets
///
/// Set 同样支持扩展运算符, Collection If 和 Collection For

void main() {
  // Set 字面量
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};

  var names = <dynamic>{}; // 类型+{}的形式创建Set。
  Set<String> ages = {}; // 声明类型变量的形式创建 Set

  var maps = {}; // 🔞 注意这种形式创建的是 Map 而非 Set

  names.add('kiss');
  print(names); // {kiss}

  // addAll 支持向 Set 中添加可迭代元素, 如数组, Set;
  // 数字, 字符串, null, Map 都不属于可迭代对象
  names.addAll(['a', 'b']);
  print(names); // {kiss, a, b}

  names.addAll(halogens);
  print(names); // {kiss, a, b, fluorine, chlorine, bromine, iodine, astatine}

  // 获取 Set 的长度
  print(names.length); // 8

  // 可通过在 Set 字面量前添加 const 关键字创建一个 Set 编译时常量
  // 此时的 constantSet 将不能使用 add / addAll 等方法
  final constantSet = const {
    'fluorine',
    'chlorine',
    'bromine',
    'iodine',
    'astatine',
  };

  // Unsupported operation: Cannot change unmodifiable set
  // constantSet.add('');
}
