/// Runes and grapheme clusters
/// Dart 使用  characters 包来访问或者操作用户感知的字符
/// 因为 Dart 中的字符串是一个 UTF-16 的字符序列, 所以如果想要表示 32 位的 Unicode,
/// 需要使用 \uXXXX 这样的语法

import 'package:characters/characters.dart';

void main() {
  const str = 'Yancey ♥ 😂';

  //  Y    a   n    c   e    y   空格  ♥   空格     😂(占两个 UTF-16 位)
  // [89, 97, 110, 99, 101, 121, 32, 9829, 32, 55357, 56834]
  print(str.codeUnits);

  print('\u{1f600}'.characters); // 😀
  print('\u2665'.characters); // ♥

  print('\u2665'.runes); // (9829)
  print('♥'.runes); // (9829)
  print('😂'.runes); // (128514)
  print('a'.runes); // (97)
}
