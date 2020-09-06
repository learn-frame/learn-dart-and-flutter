/// Dart 字符串是 UTF-16 编码的字符序列, 可使用'单引号'或者"双引号"
///
/// $var 和 ${var} 用于插值
/// 字符串可以用 + 号连接

void main() {
  // 使用反斜线来转义那些与单引号冲突的字符串
  var str = 'It\'s easy to escape the string delimiter.';

  var obj = {'firstName': 'Yancey', 'lastName': 'Leo'};

  // 使用插值
  var greet = '$str, ${obj['firstName']} ${obj['lastName']}.';
  print(greet); // Hello, Yancey Leo.

  // 使用 + 号进行字符串连接
  assert('Dart has $str, which is very handy.' ==
      'Dart has Hello, ' + 'which is very handy.');

  // 另一种字符串拼接
  var s1 = '可以拼接'
      '字符串'
      "即便它们不在同一行";
  print(s1 == '可以拼接字符串即便它们不在同一行'); // true

  // 多行字符串
  var s2 = '''
hello, 
world
''';
  print(s2);

  // 如果用 const 盛名一个变量, 那么插值表达式中只能存在是 const
  // 修饰的 null 或数值, 字符串或布尔值
  const a = 1;
  const b = [1];
  var c = 'hello';
  const d = null;

  const finalVal = '$a $d'; // 这样是可以的

  // b 为数组, c 为非 const 修饰的变量, 因此这里不可这么用
  // const finalVal = '$a $b $c';

  // 用 r(raw) 修饰的字符串, 字符串不会被做任何处理(如换行符)
  var s = r'In a raw string, not even \n gets special treatment.';
  print(s);
}
