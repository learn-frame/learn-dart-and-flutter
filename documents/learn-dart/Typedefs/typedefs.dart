/// 类型定义
///
/// 目前类型定义只能用在函数类型上, 但是将来可能会有变化

// 不使用类型定义
class SortedCollection {
  Function compare;

  SortedCollection(int f(Object a, Object b)) {
    compare = f;
  }
}

// 使用类型定义
typedef Compare = int Function(Object a, Object b);

class SortedCollection1 {
  // 手动给 compare 添加类型定义
  Compare compare;

  SortedCollection1(int f(Object a, Object b)) {
    compare = f;
  }
}

// 类型定义也可以跟泛型一起使用
typedef Compare1<T> = int Function(T a, T b);

void main() {
  int sort(Object a, Object b) => 0;
  SortedCollection coll = SortedCollection(sort);
  // 但此时的 compare 只能被推断为 Function 类型
  print(coll.compare);

  SortedCollection1 coll1 = SortedCollection1(sort);
  // 此时的 compare 就可以被推断成 int Function(Object, Object)
  print(coll1.compare);

  print(sort is Compare1<int>); // true
}
