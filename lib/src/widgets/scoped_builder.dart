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
    return BlocBuilder<Cubit<AbstractState>, AbstractState>(
      bloc: cubit,
      builder: (context, state) => switch (state) {
        InitialState _ => const SizedBox.shrink(),
        LoadingState _ => onLoading(context),
        ErrorState state => onError.call(context, state),
        LoadedState state => onSuccess.call(context, state as LoadedState<T>)
      },
    );
  }
}
