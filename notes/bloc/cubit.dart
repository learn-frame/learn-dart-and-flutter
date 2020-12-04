/// Cubit 是 Stream 的一种特殊类型, 用作 Bloc 类的基础
///
/// 一个 Cubit 可以公开触发状态变化的函数. 状态是从 Cubit 中输出的, 代表应用程序
/// 状态的一部分. 可以通知 UI 组件状态, 并根据当前状态重绘其自身的某些部分.
///
/// Cubit 的心智模型: https://bloclibrary.dev/assets/cubit_architecture_full.png

import 'package:bloc/bloc.dart';
import 'models/user_model.dart';

// 创建一个 Cubit
class UserCubit extends Cubit<UserModel> {
  UserCubit(UserModel initialState) : super(initialState);

  void updageContent(String newContent) =>
      emit(UserModel(id: state.id, title: state.title, content: newContent));

  // 可以通过重写 onChange 来获取每次变更
  // 可以拿到当前状态(currentState)和更新后的状态(nextState)
  @override
  void onChange(Change<UserModel> change) {
    print(change);
    super.onChange(change);
  }
}

void main() async {
  // 创建 Cubit 的实例
  final cubit = UserCubit(UserModel(id: '123', title: '标题', content: '内容'));

  // 对每次更新进行监听
  final subscription =
      cubit.listen((UserModel userModel) => print(userModel.content));

  // print(cubit.state.content); // 内容

  cubit.updageContent('更新的内容');
  cubit.updageContent('更新的内容1');
  cubit.updageContent('更新的内容2');
  // print(cubit.state.content); // 更新的内容2

  // 取消订阅
  // await subscription.cancel();

  // 关闭内部的 cubit 流
  await cubit.close();
}
