// Copyright (c) 2020 Yancey Inc. and its affiliates.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'screens/home/home.dart';
import 'widgets/bottom_navigation_bar.dart';

void main() => runApp(YanceyBlog());

/// The main entry for this app.
class YanceyBlog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',

      // 修改 Material Design 主题
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Try a Router'),
        ),
        body: RandomWords(),
        bottomNavigationBar: BottomNavigationBarWidget(),
      ),
    );
  }
}
