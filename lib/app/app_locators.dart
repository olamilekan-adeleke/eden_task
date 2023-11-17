import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

import '../features/auth/auth_locator.dart';
import '../features/order/order_locator.dart';

final GetIt getIt = GetIt.instance;

class AppLocator {
  static const AppLocator _instance = AppLocator._();
  const AppLocator._();
  factory AppLocator() => _instance;

  static Future<void> setup() async {
    await dotenv.load(fileName: ".env");

    setUpAuthLocator();
    setUpOrderLocator();
  }
}
