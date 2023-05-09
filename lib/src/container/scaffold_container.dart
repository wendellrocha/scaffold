import 'dart:developer' as devtools show log;

import 'package:get_it/get_it.dart';

typedef Injection = void Function(GetIt i);

abstract class ScaffoldContainer {
  final String scope;

  const ScaffoldContainer({required this.scope});

  List<Injection> get binds;

  void init() {
    GetIt.I.pushNewScope(
      scopeName: scope,
      init: (i) {
        for (final instance in binds) {
          instance.call(i);
        }
      },
    );
    devtools.log('~~~> $scope initialized'.toUpperCase());
  }

  void dispose() {
    GetIt.I.popScopesTill(scope, inclusive: true);
    devtools.log('~~~> $scope disposed'.toUpperCase());
  }
}
