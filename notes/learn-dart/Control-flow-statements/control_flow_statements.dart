var age = 24;
var map = {'name': 'yancey', age: 18};
var list = [1.2, 2.2, 3.3, 4.4];
var sets = {1, 2, 3};
var str = 'abcdef';
var isFetching = true;

void main() {
  if (age > 60) {
    print('老年');
  } else if (age > 18) {
    print('中年');
  } else {
    print('幼年');
  }

  // for...in 遍历可迭代对象, 比如 List 和 Set, 因为它们是实现了 Iterable 接口的对象
  // 🔞 注意在 dart 中字符串是不可使用 for...in 的.
  for (var item in sets) {
    print(item);
  }

  // 普通 for 循环
  for (int month = 1; month <= 12; month += 1) {
    print(month);
  }

  map.forEach((key, value) => {print(value)}); // 依次打印出 yancey 和 18
  list.forEach((value) => {print(value)}); // 依次打印出 1.2 2.2 3.3 4.4
  sets.forEach((value) => {print(value)}); // 依次打印出 1 2 3

  // while 循环会在执行循环体前先判断条件
  while (isFetching) {
    // 使用 break 可以中断循环
    if (isFetching) break;

    // 使用 continue 可以跳过本次循环直接进入下一次循环
    if (list.length < 5) {
      continue;
    }

    isFetching = false;
    print('loading...');
  }

  // do-while 循环则会先执行一遍循环体再判断条件
  do {
    isFetching = false;
    // do something...
  } while (isFetching);

  // 当然你可以用更函数式的方法来代替这些传统的流程控制语句
  // 比如下面这句, 只有 list 中的元素大于等于 3 时, 才把它打印出来
  list.where((c) => c >= 3).forEach((c) => print(c));

  var command = 'OPEN';
  switch (command) {
    case 'OPEN': // Dart 支持空的 case 语句, 允许其以 fall-through 的形式执行
    case 'CLOSED':
      // do something...;
      break;
    case 'DENIED': // 对于非空 case 语句, 可用 continue 语句配合 lable 的方式实现 fall-through
      // do something...;
      continue pending;
    pending: // 这是 'PENDING' 这个分支的标签
    case 'PENDING':
      // do something...;
      break;
    default:
    // do something...;
  }

  // 断言
  // 在 Dart 命令行可使用 dart --enable-asserts file.dart 来使 assert 生效
  // Flutter 在调试模式时生效

  // Unhandled exception:
  // 'file:///Users/yanceyleo/code/learn-frame/learn-dart-and-flutter
  // /docs/learn-dart/Control%20flow%20statements/control_flow_statements.dart'
  // : Failed assertion: line 74 pos 10: 'null': is not true.
  assert(1 == null);

  const urlString = 'https://yanceyleo.com';

  // assert 还可以添加第二个参数, 用来做一些提示
  assert(urlString.startsWith('https'),
      'URL ($urlString) should start with "https".');
}
