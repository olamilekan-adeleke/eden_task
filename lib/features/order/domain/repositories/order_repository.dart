import 'package:ably_flutter/ably_flutter.dart' as ably;
import 'package:fpdart/fpdart.dart';

import '../../../../cores/exception/base_exception.dart';

abstract class OrderRepository {
  Future<Either<Failures, ably.RealtimeChannel>> getChannel(String name);
}
