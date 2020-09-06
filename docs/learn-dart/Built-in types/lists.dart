/// 数组
///
/// 除常规操作, List 还支持 Collection If 和 Collection For

void main() {
  const constantList = [1, 2, 3];
  List<dynamic> list = ['a', 'b', 'c'];

  // 使用扩展运算符
  list = [...list, ...constantList];
  print(list); // [a, b, c, 1, 2, 3]

  // name 和 age 为 null, 如果用扩展运算符, 肯定会报错
  // 因此前面加个 ? 以避免异常
  var name;
  var age;
  list = [...list, ...?age, ...?name];
  print(list); // [a, b, c, 1, 2, 3]

  // 关于数组的方法可访问 https://api.dart.dev/stable/dart-core/List-class.html
  list.add(1);
  print(list); // [a, b, c, 1, 2, 3, 1]

  // Collection If
  const promoActive = true;
  var nav = [
    'Home',
    'Furniture',
    'Plants',
    'Money',
    if (promoActive) 'Outlet',
  ];
  print(nav); // [Home, Furniture, Plants, Money, Outlet]

  // Collection For
  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  print(listOfStrings); // [#0, #1, #2, #3]
}
