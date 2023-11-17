import 'package:ably_flutter/ably_flutter.dart' as ably;
import 'package:fpdart/fpdart.dart';

import '../../../../cores/exception/base_exception.dart';
import '../../../../cores/try_catch_helper/try_catch_helper.dart';
import '../../domain/repositories/order_repository.dart';
import '../datasources/order_data_sourse.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource remoteDataSource;

  const OrderRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failures, ably.RealtimeChannel>> getChannel(String name) {
    final action = remoteDataSource.getChannel(name);
    final tryCatchHandler = RepoTryCatchHelper<ably.RealtimeChannel>();

    return tryCatchHandler.tryAction(() => action);
  }
}
