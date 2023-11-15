import '../models/auth_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> loginWithGoogle();

  Future<AuthModel> loginWithGithub();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<AuthModel> loginWithGithub() async {
    await Future.delayed(const Duration(seconds: 2));
    throw UnimplementedError();
  }

  @override
  Future<AuthModel> loginWithGoogle() async {
    await Future.delayed(const Duration(seconds: 2));
    throw UnimplementedError();
  }
}
