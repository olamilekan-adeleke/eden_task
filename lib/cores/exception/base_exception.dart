import 'package:equatable/equatable.dart';

abstract class Failures extends Equatable {
  const Failures({
    this.message = "Something Went Wrong, Please Try Again",
    this.trace,
  });

  final String message;
  final StackTrace? trace;

  @override
  List<Object?> get props => [message, trace];

  @override
  String toString() => message;
}

class BaseFailures extends Failures {
  const BaseFailures({required String message, StackTrace? trace})
      : super(message: message, trace: trace);
}

class SocketFailures extends Failures {
  const SocketFailures({required String message, StackTrace? trace})
      : super(message: message, trace: trace);
}
