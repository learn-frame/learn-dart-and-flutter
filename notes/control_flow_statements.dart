var age = 24;
var obj = {'name': 'yancey', age: 18};
var arr = [1.2, 2.2, 3.3, 4.4];
var str = 'abcdef';
var isFetching = true;

void main() {
  if (age > 60) {
    print('老年');
  } else if (age > 18) {
    print('中年');
  } else {
    print('幼年');
  }

  // for...in 遍历可迭代对象,
  // 注意在 dart 中字符串是不可迭代的.
  for (var item in arr) {
    print(item);
  }

  // 普通 for 循环
  for (int month = 1; month <= 12; month += 1) {
    print(month);
  }

  // while 循环
  while (isFetching) {
    isFetching = false;
    print('loading...');
  }
}
