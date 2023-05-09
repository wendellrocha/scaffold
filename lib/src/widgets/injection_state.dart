import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../container/scaffold_container.dart';

abstract class InjectionState<W extends StatefulWidget, B extends Object>
    extends State<W> {
  late final B _controller;

  InjectionContainer get container;

  B get controller => _controller;

  @override
  void initState() {
    super.initState();
    container.init();
    _controller = GetIt.I.get<B>();
  }

  @override
  void dispose() {
    container.dispose();
    super.dispose();
  }
}
