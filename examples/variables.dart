// 所有变量引用都是对象, 每个对象都是一个类的实例. 数字, 函数以及 null 都是对象.
// 所有的类都继承于 Object 类
// dart 没有 public private 等限定符, 它通过下划线来表示私有成员

void main() {
  var string = '字符串';
  var intNumber = 123;
  var floatNumber = 89.64;
  var arr = ['a', 'b'];
  var obj = {
    'name': 'Yancey',
    'age': 18,
  };

  // 不能给已定义类型的变量, 重新赋予其他类型的值
  // string = 1;

  // 对于未赋初值的变量, 可以给它赋任何类型的值
  // 未赋初值的变量, 等价于赋值了 null
  var undefinedVar;
  undefinedVar = 1;
  undefinedVar = 'xx';

  // 如果想显式地声明一个不确定的类型, 可用 dynamic 修饰
  dynamic anyType = '字符串';
  anyType = 1;

  // 因为所有对象继承自 Object, 因此 dynamic 等价于 Object
  Object anyTypes = '';
  anyTypes = [];

  final currTime = DateTime.now();
  // currTime = DateTime.now();

  const firstName = 'Yancey';
  // firstName = '';

  /* 
  * const 和 final 的区别:
  * 两者都必须初始化, 初始化后都不可被改变
  * const 是编译时常量, 意味着不能赋予动态的值, 比如 DateTime.now(), 而 final 则可以
  * 如果使用 const 修饰类中的变量，则必须加上 static 关键字，即 static const
   */
}
