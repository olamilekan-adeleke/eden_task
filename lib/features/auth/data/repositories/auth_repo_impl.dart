import 'package:fpdart/fpdart.dart';

import '../../../../cores/exception/base_exception.dart';
import '../../../../cores/try_catch_helper/try_catch_helper.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/repositories/auth_repo.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  const AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failures, AuthEntity>> loginWithGithub() {
    final action = remoteDataSource.loginWithGithub();
    final tryCatchHandler = RepoTryCatchHelper<AuthEntity>();

    return tryCatchHandler.tryAction(() => action);
  }

  @override
  Future<Either<Failures, AuthEntity>> loginWithGoogle() {
    final action = remoteDataSource.loginWithGoogle();
    final tryCatchHandler = RepoTryCatchHelper<AuthEntity>();

    return tryCatchHandler.tryAction(() => action);
  }
}
