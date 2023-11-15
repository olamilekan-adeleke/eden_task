import 'package:fpdart/fpdart.dart';

import '../../../../cores/exception/base_exception.dart';
import '../entities/auth_entity.dart';

abstract class AuthRepository {
  Future<Either<Failures, AuthEntity>> loginWithGoogle();

  Future<Either<Failures, AuthEntity>> loginWithGithub();
}
