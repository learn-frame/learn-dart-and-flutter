# Business Logic Component(BLoC)

## Cubit

Cubit 是接受函数, 返回状态.

![cubit](https://bloclibrary.dev/assets/cubit_architecture_full.png)

## BLoC

而 BLoC 在 Cubit 的基础上, 还需要处理**事件**.

![bloc](https://bloclibrary.dev/assets/bloc_architecture_full.png)

### BLoC 各事件的执行顺序

- bloc 级别的 onEvent: `UserEvent.updateName`

- bus 级别的 onEvent: `UserEvent.updateName`

- bloc 级别的 onTransition: `Transition { currentState: Instance of 'UserModel', event: UserEvent.updateName, nextState: Instance of 'UserModel' }`

- bus 级别的 onTransition: `Transition { currentState: Instance of 'UserModel', event: UserEvent.updateName, nextState: Instance of 'UserModel' }`

- bloc 级别的 onChange: `Change { currentState: Instance of 'UserModel', nextState: Instance of 'UserModel' }`

- bus 级别的 onChange: `Change { currentState: Instance of 'UserModel', nextState: Instance of 'UserModel' }`

## Cubit vs BLoC

Cubit 的特点就是简单, 它本质上就是输入函数, 返回状态.

但 Cubit 的缺失就是不可回溯性. 举个例子, 从登录到注销, 可能是用户点击了注销按钮, 也可能是 token 过期强制退出的, BLoC 可以通过 onTransition 或者 onEvent 清楚的知晓, 到底触发的是哪个事件.

此外, BLoC 拥抱高级的 ReactiveX 操作, 下面的代码重写 transformEvents, 增加一个防抖的函数.

```dart
@override
Stream<Transition<CounterEvent, int>> transformEvents(
  Stream<CounterEvent> events,
  TransitionFunction<CounterEvent, int> transitionFn,
) {
  return super.transformEvents(
    events.debounceTime(const Duration(milliseconds: 300)),
    transitionFn,
  );
}
```
