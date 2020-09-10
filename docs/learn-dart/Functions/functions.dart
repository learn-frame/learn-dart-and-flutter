/// 函数
///

const _nobleGases = [1, 2, 3];

bool isNoble(int atomicNumber) {
  return _nobleGases[atomicNumber] != null;
}

void main() {
  print(isNoble(1)); // true
  // print(isNoble(3)); // 数组越界
}
