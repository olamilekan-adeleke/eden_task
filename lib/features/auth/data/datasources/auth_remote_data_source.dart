import '../models/auth_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> loginWithGoogle();

  Future<AuthModel> loginWithGithub();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<AuthModel> loginWithGithub() {
    throw UnimplementedError();
  }

  @override
  Future<AuthModel> loginWithGoogle() {
    throw UnimplementedError();
  }
}
