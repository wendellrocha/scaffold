import 'package:flutter_bloc/flutter_bloc.dart';

import '../error/failure.dart';
import '../state/abstract_state.dart';

class Store<Data extends Object> extends Cubit<AbstractState> {
  Store() : super(InitialState());

  void execute(Future<Data> Function() fn) async {
    try {
      emit(LoadingState());
      final response = await fn.call();
      emit(LoadedState(response));
    } catch (e) {
      if (e is Failure) {
        emit(ErrorState(e));
        return;
      }

      emit(ErrorState(Failure(message: e.toString())));
    }
  }
}
