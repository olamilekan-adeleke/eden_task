import 'package:eden_task/features/auth/auth_locator.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

class AppLocator {
  static const AppLocator _instance = AppLocator._();
  const AppLocator._();
  factory AppLocator() => _instance;

  static void setup() {
    setUpAuthLocator();
  }
}
