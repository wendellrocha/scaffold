import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/abstract_state.dart';

class ScaffoldStore<T> extends Cubit<AbstractState> {
  ScaffoldStore() : super(InitialState());

  void execute(Future<T> Function() fn) async {
    try {
      emit(LoadingState());
      final response = await fn.call();
      emit(LoadedState(response));
    } catch (e) {
      emit(ErrorState((e as dynamic)?.message ?? e.toString()));
    }
  }
}
