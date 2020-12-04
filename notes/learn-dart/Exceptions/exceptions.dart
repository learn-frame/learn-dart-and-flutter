// 异常捕获
import 'dart:io';

void main() {
  final astronauts = [];
  if (astronauts.length == 0) {
    throw StateError('没有宇航员。');
  } else if (astronauts.length < 3) {
    throw FormatException('Expected at least 1 section');
  } else {
    // 你甚至可以抛出字符串类型的异常
    throw 'hello, cc';
  }
}

void foo() async {
  final flybyObjects = [];

  try {
    for (var object in flybyObjects) {
      var description = await File('$object.txt').readAsString();
      print(description);
    }
  }
  // 这句 catch 只捕获 IOException 类型的异常, 当然你只写 catch 就是捕获所有的异常
  // catch 接受两个参数, 第一个是 Error, 第二个是 StackTrace
  on IOException catch (e, s) {
    print('无法描述该对象：$e');
    print('栈信息$s');

    // 使用 rethrow 可以将捕获的异常再次抛出
    rethrow;

    // 不管有没有异常都会执行的代码
  } finally {
    flybyObjects.clear();
  }
}
