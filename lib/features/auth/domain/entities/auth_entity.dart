import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final bool success;
  final String message;
  final UserDetails data;

  const AuthEntity({
    required this.success,
    required this.message,
    required this.data,
  });

  @override
  List<Object?> get props => [success, message, data];
}

class UserDetails extends Equatable {
  final String fullName;
  final String email;
  final String profilePicUrl;

  const UserDetails({
    required this.fullName,
    required this.email,
    required this.profilePicUrl,
  });

  @override
  List<Object?> get props => [fullName, email, profilePicUrl];
}
