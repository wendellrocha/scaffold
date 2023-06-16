import 'package:equatable/equatable.dart';
import 'package:scaffold/src/error/failure.dart';

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
  final Failure error;

  ErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

final class LoadedState<T> extends AbstractState {
  final T content;

  LoadedState(this.content);

  @override
  List<Object?> get props => [content];
}
