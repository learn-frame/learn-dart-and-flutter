// Copyright (c) 2020 Yancey Inc. and its affiliates.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'screens/home/home.dart';

void main() => runApp(App());

/// The main entry for this app.
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
        primaryColor: Colors.pinkAccent,
      ),
      home: HomeScreen(),
    );
  }
}
