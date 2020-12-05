/// 回顾 Stream
///

// 通过将一个函数标记为 async *, 我们可以使用 yield 作为关键字并返回 Stream 数据
Stream<int> countStream(int max) async* {
  for (var i = 0; i < max; i++) {
    yield i;
  }
}

Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;
  // 通过 await for...in 将 Stream 数据输出
  await for (final value in stream) {
    sum += value;
  }
  return sum;
}

void main() async {
  // 先等待 Stream 中的每个结果
  final stream = countStream(10);

  // 再返回 Stream 的每个结果的总和
  final sum = await sumStream(stream);
  print(sum); // 45
}
