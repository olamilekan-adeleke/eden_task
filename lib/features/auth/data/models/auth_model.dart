import '../../domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  const AuthModel({required super.success, required super.message});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      success: json['success'] as bool,
      message: json['message'] as String,
    );
  }
}
