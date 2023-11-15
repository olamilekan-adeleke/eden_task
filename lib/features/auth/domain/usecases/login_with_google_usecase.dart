import 'dart:async';

import 'package:fpdart/fpdart.dart';

import '../../../../../cores/usecase/params.dart';
import '../../../../../cores/usecase/usecase_interface.dart';
import '../../../../cores/exception/base_exception.dart';
import '../entities/auth_entity.dart';
import '../repositories/auth_repo.dart';

class LoginWithGoogleUsecase
    implements UseCaseFuture<Failures, AuthEntity, NoParams> {
  final AuthRepository repository;

  const LoginWithGoogleUsecase({required this.repository});

  @override
  FutureOr<Either<Failures, AuthEntity>> call(NoParams params) async {
    return await repository.loginWithGoogle();
  }
}
