/// Extension 方法

// 如果你引用了多个文件, 而这些文件中有相同的扩展方法(但是不是相同的扩展名), 你需要选择只留一个,
// 并将其他文件中相同的方法扩展使用 `hide` 隐藏掉, 否则下面在使用 parseInt 方法时会报错
import 'string_apis.dart';
// 🔞 注意请将 NumberParsing2 隐藏掉, 因为 NumberParsing2 中也存在一个相同的 parseInt 方法
import 'string_apis_2.dart' hide NumberParsing2;

// 当然你也可以两个库都同时引用而不去使用 `hide` 做忽略, 但使用时必须使用相应的扩展名
// import 'string_apis.dart';
// import 'string_apis_2.dart'
// print(NumberParsing('42').parseInt());
// print(NumberParsing2('42').parseInt());

// 如果你引用了多个文件, 而这些文件中有相同的扩展方法(并且也有相同的扩展名), 你需要将一个使用 as 转一下
// import 'string_apis.dart';
// import 'string_apis_3.dart' as rad;
// print(NumberParsing('42').parseInt()); // 使用 string_apis 库中, NumberParsing 旗下的 parseInt 方法
// print(rad.NumberParsing('42').parseInt()); // 使用 string_apis_3 库中, NumberParsing 旗下的 parseInt 方法
// print('42.0'.parseDouble()); // 因为 parseDouble 是 string_apis_3 库中独有的, 虽然它也在 NumberParsing 旗下, 但因为没有引用冲突, 故可以直接使用

void main(List<String> args) {
  // 对于 int 类型, 内置了一个 parse 方法, 用于将整型字符串转换为 int 类型
  print(int.parse('42')); // 42

  // 但是 dart 并没有内置如下的方法, 我们可以通过 Extension 方法来实现
  print('42'.parseInt()); // 42

  // 🔞 注意对于使用扩展的方法, 该变量不能被设为 dynamic 类型
  dynamic str = '42';
  str.parseInt(); // NoSuchMethodError: Class 'String' has no instance method 'parseInt'.
}
