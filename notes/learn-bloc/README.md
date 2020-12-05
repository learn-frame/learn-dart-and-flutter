# Business Logic Component(Bloc)

## Cubit

Cubit 是接受函数, 返回状态.

![cubit](https://bloclibrary.dev/assets/cubit_architecture_full.png)

## Bloc

而 Bloc 在 Cubit 的基础上, 还需要处理**事件**.

![bloc](https://bloclibrary.dev/assets/bloc_architecture_full.png)

### Bloc 各事件的执行顺序

- bloc 级别的 onEvent: `UserEvent.updateName`

- bus 级别的 onEvent: `UserEvent.updateName`

- bloc 级别的 onTransition: `Transition { currentState: Instance of 'UserModel', event: UserEvent.updateName, nextState: Instance of 'UserModel' }`

- bus 级别的 onTransition: `Transition { currentState: Instance of 'UserModel', event: UserEvent.updateName, nextState: Instance of 'UserModel' }`

- bloc 级别的 onChange: `Change { currentState: Instance of 'UserModel', nextState: Instance of 'UserModel' }`

- bus 级别的 onChange: `Change { currentState: Instance of 'UserModel', nextState: Instance of 'UserModel' }`

## Cubit vs Bloc

Cubit 的特点就是简单, 它本质上就是输入函数, 返回状态.

但 Cubit 的缺失就是不可回溯性. 举个例子, 从登录到注销, 可能是用户点击了注销按钮, 也可能是 token 过期强制退出的, Bloc 可以通过 onTransition 或者 onEvent 清楚的知晓, 到底触发的是哪个事件.

此外, Bloc 拥抱高级的 ReactiveX 操作, 下面的代码重写 transformEvents, 增加一个防抖的函数.

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

## Flutter Bloc 架构

- 表现层 (数据渲染, 可以类比为触发 action)

- 业务逻辑 (用于处理前端事件, 可以类比为 effect)

- 数据层

  - 数据源/库 (真正请求接口, 并返回处理后的数据, 可以类比为 reducer)

  - 数据提供者 (service 层)

```dart
// Service 层, 用于声明接口
class DataProvider {
  Future<RawData> readData() async {
      // Read from DB or make network request etc...
  }
}

// Repository 层, 用于请求数据, 并进行数据处理
class Repository {
  final DataProviderA dataProviderA;
  final DataProviderB dataProviderB;

  Future<Data> getAllDataThatMeetsRequirements() async {
    final RawDataA dataSetA = await dataProviderA.readData();
    final RawDataB dataSetB = await dataProviderB.readData();
    final Data filteredData = _filterData(dataSetA, dataSetB);
    return filteredData;
  }
}

// 业务逻辑层, 响应指定的 action, 触发副作用
class BusinessLogicComponent extends Bloc<MyEvent, MyState> {
  final Repository repository;

  Stream mapEventToState(event) async* {
    if (event is AppStarted) {
      try {
        final data = await repository.getAllDataThatMeetsRequirements();
        yield Success(data);
      } catch (error) {
        yield Failure(error);
      }
    }
  }
}

// 表现层(UI 层), 用于触发事件
class PresentationComponent {
    final Bloc bloc;

    PresentationComponent() {
        bloc.add(AppStarted());
    }

    build() {
        // render UI based on bloc state
    }
}
```

```dart
// Bloc 间的通信
class MyBloc extends Bloc {
  final OtherBloc otherBloc;
  StreamSubscription otherBlocSubscription;

  MyBloc(this.otherBloc) {
    otherBlocSubscription = otherBloc.listen((state) {
        // React to state changes here.
        // Add events here to trigger changes in MyBloc.
    });
  }

  @override
  Future<void> close() {
    otherBlocSubscription.cancel();
    return super.close();
  }
}
```
