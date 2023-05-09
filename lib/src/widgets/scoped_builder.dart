import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/abstract_state.dart';

class ScopedBuilder<T> extends StatelessWidget {
  final Cubit<AbstractState> cubit;
  final Widget Function(BuildContext context) onLoading;
  final Widget Function(BuildContext context, ErrorState state) onError;
  final Widget Function(BuildContext context, LoadedState<T> state) onSuccess;

  const ScopedBuilder({
    super.key,
    required this.onError,
    required this.onLoading,
    required this.onSuccess,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    Widget child = const SizedBox();

    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) {
        if (state is LoadingState) {
          child = onLoading.call(context);
          return child;
        }

        if (state is ErrorState) {
          child = onError.call(context, state);
          return child;
        }

        child = onSuccess.call(context, state as LoadedState<T>);
        return child;
      },
    );
  }
}
