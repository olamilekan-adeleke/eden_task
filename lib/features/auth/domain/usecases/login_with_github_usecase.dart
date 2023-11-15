import 'dart:async';

import 'package:fpdart/fpdart.dart';

import '../../../../../cores/usecase/usecase_interface.dart';
import '../../../../cores/base_request_body/base_request_body.dart';
import '../../../../cores/exception/base_exception.dart';
import '../entities/auth_entity.dart';
import '../repositories/auth_repo.dart';

class LoginWithGithubUsecase
    implements UseCaseFuture<Failures, AuthEntity, RequestParam> {
  final AuthRepository repository;

  const LoginWithGithubUsecase({required this.repository});

  @override
  FutureOr<Either<Failures, AuthEntity>> call(RequestParam params) async {
    return await repository.loginWithGithub(params);
  }
}
