import 'dart:io';

import 'package:fpdart/fpdart.dart';

import '../exception/base_exception.dart';
import 'logger.dart';

typedef TryCatchHandler<T> = Future<T> Function(dynamic error);

class RepoTryCatchHelper<T> {
  Future<Either<Failures, T>> tryAction(Future<T> Function() action) async {
    try {
      final T result = await action.call();

      return Right(result);
    } on TypeError catch (e, s) {
      LoggerHelper.log(e, s);

      return const Left(BaseFailures(message: "Unable to format data"));
    } on FormatException catch (e, s) {
      LoggerHelper.log(e, s);

      return const Left(BaseFailures(message: "Unable to format data"));
    } on SocketException catch (e, s) {
      LoggerHelper.log(e, s);

      return const Left(
          SocketFailures(message: "No Internet Connection, Please Try Again"));
    } catch (e, s) {
      LoggerHelper.log(e, s);

      if (e is BaseFailures) {
        return Left(BaseFailures(message: e.message));
      }

      return Left(BaseFailures(message: e.toString()));
    }
  }
}
