import 'package:fpdart/fpdart.dart';

import '../../../../cores/exception/base_exception.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/repositories/auth_repo.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<Failures, AuthEntity>> loginWithGithub() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, AuthEntity>> loginWithGoogle() {
    throw UnimplementedError();
  }
}
