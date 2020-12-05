import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/posts_bloc.dart';

// BlocProvider
class BlocBuilderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsBloc, PostsState>(
      cubit: PostsBloc(),
      buildWhen: (previousState, state) {
        // 类似于 React 中的 shouldComponentUpdate. 如果返回 false,
        // 就不会调用下面的 builder
      },
      builder: (context, state) {
        // return widget here based on BlocA's state
      },
    );
  }
}

// MultiBlocProvider
class BlocProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final withExtensions = context.read<PostsBloc>();
    final withoutExtensions = BlocProvider.of<PostsBloc>(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider<PostsBloc>(
          create: (BuildContext context) => PostsBloc(),
        ),
        BlocProvider<PostsBloc>(
          create: (BuildContext context) => PostsBloc(),
        ),
        BlocProvider<PostsBloc>(
          create: (BuildContext context) => PostsBloc(),
        ),
      ],
      child: Container(),
    );
  }
}

// BlocListener
class BlocListenerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<PostsBloc, PostsState>(
      // 仅当您无法通过 BlocProvider 和当前的 BuildContext 访问的 bloc 时, 才指定 bloc
      cubit: PostsBloc(),
      listenWhen: (previousState, state) {
        // return true/false to determine whether or not
        // to call listener with state
      },
      listener: (context, state) {
        // do stuff here based on BlocA's state
      },
      child: Container(),
    );
  }
}

// MultiBlocListener
class MultiBlocListenerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<PostsBloc, PostsState>(
          listener: (context, state) {},
        ),
        BlocListener<PostsBloc, PostsState>(
          listener: (context, state) {},
        ),
        BlocListener<PostsBloc, PostsState>(
          listener: (context, state) {},
        ),
      ],
      child: Container(),
    );
  }
}

// BlocConsumer
class BlocConsumerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostsBloc, PostsState>(
      listenWhen: (previous, current) {
        // return true/false to determine whether or not
        // to invoke listener with state
      },
      listener: (context, state) {
        // do stuff here based on BlocA's state
      },
      buildWhen: (previous, current) {
        // return true/false to determine whether or not
        // to rebuild the widget with state
      },
      builder: (context, state) {
        // return widget here based on BlocA's state
      },
    );
  }
}

// RepositoryProvider
class RepositoryProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final withExtensions = context.read<PostsBloc>();
    final withoutExtensions = RepositoryProvider.of<PostsBloc>(context);

    return RepositoryProvider(
      create: (context) => PostsBloc(),
      child: Container(),
    );
  }
}

// MultiRepositoryProvider
class MultiRepositoryProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<PostsBloc>(
          create: (context) => PostsBloc(),
        ),
        RepositoryProvider<PostsBloc>(
          create: (context) => PostsBloc(),
        ),
        RepositoryProvider<PostsBloc>(
          create: (context) => PostsBloc(),
        ),
      ],
      child: Container(),
    );
  }
}
