/// 可迭代集合
///
/// 在 Dart 中, List, Set是可迭代集合, 它们可以使用 for...in 遍历
/// 文档: https://api.dart.dev/stable/dart-collection/dart-collection-library.html

void main(List<String> args) {
  final list = ['Yancey', 'Sayaka', 'Make'];
  for (final element in list) {
    print(element);
  }

  Iterable<int> iterable = [0, 1, 2, 3, 4, 5, 6];
  // int value = iterable[1]; // 🔞 可迭代对象不能使用下标的方式获取 value.
  // 而需要使用 elementAt 方法获取
  print(iterable.elementAt(1));

  // 可迭代集合自带两个属性 first 和 last, 分别获取第一个和最后一个.
  print(iterable.first);
  print(iterable.last);

  // 找出 list 第一个字符串长度大于 10 的元素, 如果找不到, 返回 'None!'
  list.firstWhere(
    (element) => element.length > 10,
    orElse: () => 'None!',
  );

  // 找出第一个 list 首字母为 'M', 且包含字母 'e' 的元素,
  // 如果没有将会报错(Bad state: No element), 如果有多个将会报错(Bad state: Too many elements)
  list.singleWhere((element) => element[0] == 'M' && element.contains('e'));

  // every, 返回 Boolean 类型
  list.every((element) => element.length >= 5);

  // any, 返回 Boolean 类型
  list.any((element) => element.contains('a'));

  // map, 返回新的可迭代集合
  list.map((element) => 'hello, $element');

  // where, 类似于 JavaScript 的 filter
  list.where((el) => el.length > 5);

  // takeWhile, 根据条件获取它之前的子可迭代集合
  print(iterable.takeWhile((number) => number != 3)); // (0, 1, 2)

  // skipWhile, 根据条件获取它之后的子可迭代集合
  print(iterable.skipWhile((number) => number != 3)); // (3, 4, 5, 6)
}
