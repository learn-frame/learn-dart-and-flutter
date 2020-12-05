/// Business Logic Component(BLoC)
/// Bloc 是 Cubit 的一种特殊类型, 可将传入事件转换为传出状态

import 'package:bloc/bloc.dart';
import 'package:english_words/english_words.dart';
import 'models/user_model.dart';

enum UserEvent { updateName }

class UserBloc extends Bloc<UserEvent, UserModel> {
  UserBloc(UserModel initialState) : super(initialState);

  UserModel updateName(String newName) {
    return UserModel(id: state.id, name: newName, gender: state.gender);
  }

  @override
  Stream<UserModel> mapEventToState(UserEvent event) async* {
    switch (event) {
      case UserEvent.updateName:
        // addError(Exception('udate error!'), StackTrace.current);
        yield updateName(WordPair.random().toString());
        break;
    }
  }

  // onChange 包含 currentState, nextState
  @override
  void onChange(Change<UserModel> change) {
    print('bloc 级别的 $change');
    super.onChange(change);
  }

  // onTransition 包含 currentState, event, nextState
  @override
  void onTransition(Transition<UserEvent, UserModel> transition) {
    print('bloc 级别的 $transition');
    super.onTransition(transition);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }

  @override
  void onEvent(UserEvent event) {
    print('bloc 级别的 $event');
    super.onEvent(event);
  }
}

// 总线级别的观察者
class BlocObserverBus extends BlocObserver {
  @override
  void onChange(Cubit cubit, Change change) {
    print('bus 级别的 $change');
    super.onChange(cubit, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('bus 级别的 $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print('${cubit.runtimeType} $error $stackTrace');
    super.onError(cubit, error, stackTrace);
  }

  @override
  void onEvent(Bloc bloc, Object event) {
    print('bus 级别的 $event');
    super.onEvent(bloc, event);
  }
}

void main() async {
  Bloc.observer = BlocObserverBus();

  final userBloc = UserBloc(UserModel(id: '1', name: 'Yancey', gender: 'male'));
  userBloc
    ..add(UserEvent.updateName)
    ..add(UserEvent.updateName)
    ..add(UserEvent.updateName)
    ..add(UserEvent.updateName);

  // print(userBloc.state.gender); // male
  // userBloc.add(UserEvent.updateName);

  // await Future.delayed(Duration.zero); // 模拟异步, 以等待下一个事件循环迭代

  // print(userBloc.state.gender); // female

  // 和 Cubit 一样, 可以对每次 mutation 做监听
  // final subscription = userBloc.listen(print);
  // await subscription.cancel();
  // await userBloc.close();
}
