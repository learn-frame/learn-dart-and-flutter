/* 
* 异步 
*/

import 'dart:io';
import '../Classes/basic_classes.dart';

var voyager = new Spacecraft('旅行者一号', 4, DateTime(1977, 9, 5));

void main() {
  report(voyager, ['小李']);
  sleepWithCallback('2s后展示我', Duration(seconds: 2));
  sleepWithAsyncAwait('1s后展示我', Duration(seconds: 1));
  createDescriptions(['demo']);
}

// 类似于 Promise, 会产生类似 Callback Hell
Future<void> sleepWithCallback(String message, Duration seconds) {
  return Future.delayed(seconds).then((_) {
    print(message);
  });
}

// Async / Await
Future<void> sleepWithAsyncAwait(String message, Duration seconds) async {
  await Future.delayed(seconds);
  print(message);
}

// 创建文件
Future<void> createDescriptions(Iterable<String> objects) async {
  for (var object in objects) {
    try {
      var file = File('$object.txt');
      if (await file.exists()) {
        var modified = await file.lastModified();
        print('文件 $object 已经存在。它上一次的修改时间为 $modified。');
        continue;
      }
      await file.create();
      await file.writeAsString('开始在此文件中描述 $object。');
    } on IOException catch (e) {
      print('不能为 $object 创建描述：$e');
    }
  }
}

// yield 创建流
Stream<String> report(Spacecraft craft, Iterable<String> objects) async* {
  for (var object in objects) {
    await Future.delayed(Duration(seconds: 3));
    yield '${craft.name} 由 $object 飞行。';
  }
}
