import 'dart:async';

import 'package:ably_flutter/ably_flutter.dart' as ably;
import 'package:fpdart/fpdart.dart';

import '../../../../../cores/usecase/usecase_interface.dart';
import '../../../../cores/exception/base_exception.dart';
import '../repositories/order_repository.dart';

class GetChannelUsecase
    implements UseCaseFuture<Failures, ably.RealtimeChannel, String> {
  final OrderRepository repository;

  const GetChannelUsecase({required this.repository});

  @override
  FutureOr<Either<Failures, ably.RealtimeChannel>> call(String params) async {
    return await repository.getChannel(params);
  }
}
