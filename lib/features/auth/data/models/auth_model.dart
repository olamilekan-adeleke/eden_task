// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  const AuthModel({
    required super.success,
    required super.message,
    required super.data,
  });
}

class UserDetailsModel extends UserDetails {
  const UserDetailsModel({
    required super.fullName,
    required super.email,
    required super.profilePicUrl,
  });

  UserDetailsModel copyWith({
    String? fullName,
    String? email,
    String? profilePicUrl,
  }) {
    return UserDetailsModel(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      profilePicUrl: profilePicUrl ?? this.profilePicUrl,
    );
  }
}
