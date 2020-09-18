/// 生成器

// 同步生成器
Iterable<int> naturalsTo(int n) sync* {
  int k = 0;
  while (k < n) yield k++;
}

// 异步生成器

void main(List<String> args) {
  print(naturalsTo(5)); // (0, 1, 2, 3, 4)
}
