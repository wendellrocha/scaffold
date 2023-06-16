import 'package:equatable/equatable.dart';

class Failure extends Equatable implements Exception {
  final String message;
  final int? statusCode;
  final StackTrace? stackTrace;

  const Failure({required this.message, this.statusCode, this.stackTrace});

  @override
  String toString() => 'Failure(message: $message, statusCode: $statusCode,'
      ' stackTrace: $stackTrace)';

  @override
  List<Object?> get props => [message, statusCode, stackTrace];
}
