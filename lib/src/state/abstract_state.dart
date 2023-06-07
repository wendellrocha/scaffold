import 'package:equatable/equatable.dart';

sealed class AbstractState extends Equatable {}

final class InitialState extends AbstractState {
  @override
  List<Object?> get props => [];
}

final class LoadingState extends AbstractState {
  @override
  List<Object?> get props => [];
}

final class ErrorState extends AbstractState {
  final String message;

  ErrorState(this.message);

  @override
  List<Object?> get props => [];
}

final class LoadedState<T> extends AbstractState {
  final T content;

  LoadedState(this.content);

  @override
  List<Object?> get props => [content];
}
