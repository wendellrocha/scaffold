import 'dart:developer' as devtools show log;

import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

typedef Injection = void Function(GetIt i);
typedef Route = GoRoute;

abstract class Scope {
  final String name;

  const Scope(this.name);

  List<Injection> get binds;
  List<Route> get routes;

  void init() {
    GetIt.I.pushNewScope(
      scopeName: name,
      init: (i) {
        for (final instance in binds) {
          instance.call(i);
        }
      },
    );
    devtools.log('~> $name initialized'.toUpperCase());
  }

  void dispose() {
    GetIt.I.popScopesTill(name, inclusive: true);
    devtools.log('~> $name disposed'.toUpperCase());
  }
}
