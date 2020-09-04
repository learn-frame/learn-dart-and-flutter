/// Dart 字符串是 UTF-16 编码的字符序列, 可使用单引号或者双引号
///
/// $var 和 ${var} 用于插值
/// 字符串可以用 + 号连接

void main() {
  var str = 'Hello';
  var obj = {'firstName': 'Yancey', 'lastName': 'Leo'};

  // 使用插值
  var greet = '$str, ${obj['firstName']} ${obj['lastName']}.';
  print(greet); // Hello, Yancey Leo.

  // 使用 + 号连接
  assert('Dart has $str, which is very handy.' ==
      'Dart has Hello, ' + 'which is very handy.');
}
