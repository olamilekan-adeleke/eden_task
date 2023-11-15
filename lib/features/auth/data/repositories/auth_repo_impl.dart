import 'package:fpdart/fpdart.dart';

import '../../../../cores/exception/base_exception.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/repositories/auth_repo.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  const AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failures, AuthEntity>> loginWithGithub() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, AuthEntity>> loginWithGoogle() {
    throw UnimplementedError();
  }
}
