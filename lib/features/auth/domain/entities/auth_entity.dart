import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final bool success;
  final String message;

  const AuthEntity({required this.success, required this.message});

  @override
  List<Object?> get props => [success, message];
}
