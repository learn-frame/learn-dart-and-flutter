// 异常捕获
import 'dart:io';

void main() {
  final astronauts = [];
  if (astronauts.length == 0) {
    throw StateError('没有宇航员。');
  }
}

void foo() async {
  final flybyObjects = [];

  try {
    for (var object in flybyObjects) {
      var description = await File('$object.txt').readAsString();
      print(description);
    }
  } on IOException catch (e) {
    print('无法描述该对象：$e');
  } finally {
    flybyObjects.clear();
  }
}
