/// 可调用类
/// 通过实现类的 call() 方法, 允许使用类似函数调用的方式来使用该类的实例

class WannabeFunction {
  // 实现 call 方法
  String call(String a, String b, String c) => '$a $b $c!';
}

var wf = WannabeFunction();
var out = wf('Hi', 'there,', 'gang');

main() => print(out);
