import 'package:example/models/person_model.dart';
import 'package:scaffold/scaffold.dart';

import 'app_widget.dart';

class AppWidgetScope extends Scope {
  AppWidgetScope() : super('AppWidget');

  @override
  List<Injection> get binds => [
        (i) => i.registerSingleton<PersonMoodel>(
              const PersonMoodel(name: "Wendell Rocha", age: 27),
            ),
      ];

  @override
  List<Route> get routes => [
        Route(path: '/', builder: (context, state) => const AppWidget()),
      ];
}
