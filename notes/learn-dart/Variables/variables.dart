void main() {
  var string = '字符串';
  var intNumber = 123;
  var floatNumber = 89.64;
  var arr = ['a', 'b'];
  var obj = {
    'firstName': 'Yancey',
    'lastName': 'Leo',
    'greeting': (String msg) => 'hello, $msg',
  };

  // 不能给已定义类型的变量, 重新赋予其他类型的值
  // string = 1;

  // 对于未赋初值的变量, 可以给它赋任何类型的值
  // 未赋初值的变量, 等价于赋值了 null
  var undefinedVar;
  print(undefinedVar == null); // true
  undefinedVar = 1;
  undefinedVar = 'xx';

  // 如果想显式地声明一个不确定的类型, 可用 dynamic 修饰
  dynamic anyType = '字符串';
  anyType = 1;

  // 因为所有对象继承自 Object, 因此 dynamic 等价于 Object
  Object anyTypes = '';
  anyTypes = [];

  final currTime = DateTime.now();
  // currTime = DateTime.now(); // 出错

  const firstName = 'Yancey';
  // firstName = ''; // 出错

  // const 关键字不仅仅可以用来定义常量, 还可以用来创建常量值
  var foo = const [];
  final bar = const [];

// 强制类型转换
  const Object i = 3;
  const list = [i as int];
  const map = {if (i is int) i: "int"};
  const set = {if (list is List<int>) ...list};

  list.add(1);
  map[1] = 'hello';
}

/* 
  * const 和 final 的区别:
  * 两者都必须初始化, 初始化后都不可被改变
  * const 是编译时常量, 意味着不能赋予动态的值, 比如 DateTime.now(), 而 final 则可以
  * 如果使用 const 修饰类中的变量, 则必须加上 static 关键字, 即 static const
   */

// 变量的值不能改变, 即不能重新赋值, 是'编译时常量' (compile-time constant)
// 变量的引用地址不能改变, 而引用地址里的内容可以变, 
// 是'运行时不变量' (runtime immutable variable)