import 'dart:convert';
// import 'dart:html';
import 'dart:io';

void searchFile(FileSystemEntity entity) {
  // do something...
}

// Stream 可用于异步循环
Stream getDic(String searchPath) {
  FileSystemEntity.isDirectory(searchPath).then((isDir) {
    if (isDir) {
      final startingDir = Directory(searchPath);
      startingDir.list(recursive: false, followLinks: false).listen((entity) {
        if (entity is File) {
          searchFile(entity);
        }
      });
    } else {
      // do else something...
    }
  });
}

// await for 方式的用于异步循环
Future getDic2(String searchPath) async {
  if (await FileSystemEntity.isDirectory(searchPath)) {
    final startingDir = Directory(searchPath);

    await for (var entity
        in startingDir.list(recursive: false, followLinks: false)) {
      if (entity is File) {
        searchFile(entity);
      }
    }
  } else {
    searchFile(File(searchPath));
  }
}

// 异步循环的处理错误和完成
Future readFileAwaitFor() async {
  var config = File('config.txt');
  Stream<List<int>> inputStream = config.openRead();

  var lines = inputStream.transform(utf8.decoder).transform(LineSplitter());
  try {
    await for (var line in lines) {
      print('Got ${line.length} characters from stream');
    }
    print('file is now closed');
  } catch (e) {
    print(e);
  }
}

// 使用 Stream API 进行异步循环的处理错误和完成
Future readFileByStream() {
  var config = File('config.txt');
  Stream<List<int>> inputStream = config.openRead();

  inputStream.transform(utf8.decoder).transform(LineSplitter()).listen(
      (String line) {
    print('Got ${line.length} characters from stream');
  }, onDone: () {
    print('file is now closed');
  }, onError: (e) {
    print(e);
  });
}

Future main(List<String> arguments) async {
  // 监听数据流
  // querySelector('#submitInfo').onClick.listen((e) {
  //   // When the button is clicked, it runs this code.
  // });

  // 传递流数据
  var config = File('config.txt');
  Stream<List<int>> inputStream = config.openRead();
  var lines = inputStream.transform(utf8.decoder).transform(LineSplitter());
}
