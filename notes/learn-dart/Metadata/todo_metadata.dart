library todo;

class Todo {
  @deprecated
  final String who;

  final String what;

  // 常量构造函数, 或者编译时常量方可作为注解
  const Todo(this.who, this.what);
}
