/// 函数
///
/// 有箭头函数和普通函数两种, 

const _nobleGases = [1, 2, 3];

bool isNoble(int atomicNumber) {
  return _nobleGases[atomicNumber] != null;
}

// 箭头函数
bool isNoble2(int atomicNumber) => _nobleGases[atomicNumber] != null;

void main() {
  print(isNoble(1)); // true
  // print(isNoble(3)); // 数组越界
}
