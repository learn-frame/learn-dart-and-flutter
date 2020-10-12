///  泛型
///
/// 泛型常用于需要要求类型安全的情况, 但是它也会对代码运行有好处:
/// 1. 适当地指定泛型可以更好地帮助代码生成
/// 2. 使用泛型可以减少代码重复

void main() {
  final names = List<String>();
  names.addAll(['Yancey', 'Sayaka']);
  // names.add(1); // 出错, names 只能接受字符串类型的参数
}
