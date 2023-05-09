import 'package:equatable/equatable.dart';

abstract class AbstractState extends Equatable {}

class InitialState extends AbstractState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends AbstractState {
  @override
  List<Object?> get props => [];
}

class ErrorState extends AbstractState {
  final String message;

  ErrorState(this.message);

  @override
  List<Object?> get props => [];
}

class LoadedState<T> extends AbstractState {
  final T content;

  LoadedState(this.content);

  @override
  List<Object?> get props => [content];
}
