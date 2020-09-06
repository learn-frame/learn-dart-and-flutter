/// Boolean 类型

void main() {
  // 检查是否为空字符串
  var fullName = '';
  print(fullName.isEmpty); // true

  // 检查是否小于等于零
  var hitPoints = 0;
  print(hitPoints <= 0); // true

  // 检查是否为 null
  var unicorn;
  print(unicorn == null); // true

  // 检查是否为 NaN
  var iMeantToDoThis = 0 / 0;
  print(iMeantToDoThis.isNaN); // true
}
