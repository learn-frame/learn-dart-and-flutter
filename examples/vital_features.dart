// import 'dart:html';

void main() {
  print(stringify('hello', 1)); // 1: HELLO
  print(avoidEmpty('hi')); // hi; HI
  print(sayAnything(str: 'ff')); // ff
  print(sayAnything()); // null

  final getterSetter = GetterSetter();
  print(getterSetter.aProperty); // 0
  getterSetter.aProperty = 5;
  print(getterSetter.aProperty); // 5

  print(sumUpToFive(1, 2, 3)); // 6
}

/* 
* 字符串插值:
* 使用 ${expression} 或 $var
*/
String stringify(String x, int y) {
  return '$y: ${x.toUpperCase()}';
}

/* 
* 避空运算符:
* `??=` 仅当该变量为空值时才为其赋值
* `??` 该运算符左边的表达式返回的是空值, 则会计算并返回右边的表达式
* `??` 理解为其他正经语言的 `||` 就好
 */
String avoidEmpty(String x) {
  var a;
  var b;
  return '${a ??= x}; ${b ?? x.toUpperCase()}';
}

/* 
* 条件属性访问(Optional Chaining):
* 即使用 `?.` 操作符
 */
String sayAnything({String str}) {
  return str?.toLowerCase();
}

void listMapSet() {
  final List<String> list = ['one', 'two', 'three'];
  final Set<String> set = {'one', 'two', 'three'};
  final Map<String, int> map = {
    'one': 1,
    'two': 2,
    'three': 3,
  };

  // 手动指定类型
  final anEmptyListOfDouble = <double>[];
  final anEmptySetOfString = <String>{};
  final anEmptyMapOfDoublesToInts = <double, int>{};

  print(list);
  print(set);
  print(map);
}

/* 
* 箭头函数:
 */
bool isFetching(int type) => type == 1;

/* 
* 级联(Cascades): 对同一对象执行一系列操作, 可使用级联
 */
// void tryCascades() {
//   // 下面的代码都是对 button 元素进行的操作
//   var button = querySelector('#confirm');
//   button.text = 'Confirm';
//   button.classes.add('important');
//   button.onClick.listen((e) => window.alert('Confirmed!'));

//   // 使用级联会更加优雅
//   querySelector('#confirm')
//     ..text = 'Confirm'
//     ..classes.add('important')
//     ..onClick.listen((e) => window.alert('Confirmed!'));
// }

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

/* 
* 可选参数和默认参数:
* dart 中的可选参数有两种形式, 一种叫可选位置参数, 一种叫可选命名参数
* 一个函数中不能同时使用可选位置参数和可选命名参数
 */

// 中括号包裹的叫做可选位置参数, 你可以为可选参数添加默认值
int sumUpToFive(int a, [int b, int c, int d, int e = 3]) {
  int sum = a;
  if (b != null) sum += b;
  if (c != null) sum += c;
  if (d != null) sum += d;
  if (e != null) sum += e;
  return sum;
}

// 中括号包裹的叫做可选命名参数, 你可以为可选参数添加默认值
void printName(String firstName, String lastName, {String suffix = ''}) {
  print('$firstName $lastName $suffix');
}

/* 
* Exceptions
 */
