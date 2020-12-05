/// Cubit 是 Stream 的一种特殊类型, 用作 Bloc 类的基础
///
/// 一个 Cubit 可以公开触发状态变化的函数. 状态是从 Cubit 中输出的, 代表应用程序
/// 状态的一部分. 可以通知 UI 组件状态, 并根据当前状态重绘其自身的某些部分.

import 'package:bloc/bloc.dart';
import 'models/user_model.dart';

class UserCubit extends Cubit<UserModel> {
  UserCubit(UserModel initialState) : super(initialState);

  void updateGender(String newGender) {
    // addError(Exception('udate error!'), StackTrace.current);
    emit(UserModel(id: state.id, name: state.name, gender: newGender));
  }

  // 可以通过重写 onChange 来处理 Cubit 级别的变更记录
  // 可以拿到当前状态(currentState)和更新后的状态(nextState)
  @override
  void onChange(Change<UserModel> change) {
    print(change);
    super.onChange(change);
  }

  // 可以通过重写 onError 来处理 Cubit 级别的错误记录
  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}

class NumCubit extends Cubit<int> {
  NumCubit(int initialState) : super(initialState);

  void sum() => emit(state + 1);
}

// 总线监听器
class BlocObserverBus extends BlocObserver {
  // 总线级别的 onChange
  @override
  void onChange(Cubit cubit, Change change) {
    print('${cubit.runtimeType} $change');
    super.onChange(cubit, change);
  }

  // 总线级别的 onError
  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print('${cubit.runtimeType} $error $stackTrace');
    super.onError(cubit, error, stackTrace);
  }
}

void main() async {
  // 总线监听
  // 如果 Cubit 内部重写了的 onChange, 会先调用内部的, 再调用总线的
  Bloc.observer = BlocObserverBus();

  // - - - - - - - - - - - - - - - - - - - - - -

  // 创建 Cubit 的实例
  final userCubit =
      UserCubit(UserModel(id: '123', name: 'Yancey Leo', gender: '男'));

  // 对每次更新进行监听订阅
  // final subscription =
  //     userCubit.listen((UserModel userModel) => print(userModel.content));

  userCubit..updateGender('女')..updateGender('男')..updateGender('女');

  // 取消订阅
  // await subscription.cancel();

  // 关闭内部的 cubit 流
  // await userCubit.close();

  // - - - - - - - - - - - - - - - - - - - - - -

  final numCubit = NumCubit(0);
  numCubit..sum()..sum();
}
