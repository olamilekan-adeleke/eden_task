import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/auth/domain/entities/auth_entity.dart';
import '../../features/auth/presentation/pages/login_view.dart';
import '../../features/order/presentation/pages/order_home_view.dart';
import '../../features/order/presentation/pages/order_status_view.dart';
import 'error_route_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Object? args = settings.arguments;

    switch (settings.name) {
      case LoginView.routeName:
        return pageRoute(const LoginView());

      case OrderHomeView.routeName:
        final userData = args as UserDetails;
        return pageRoute(OrderHomeView(userData));

      case OrderStatusView.routeName:
        return pageRoute(const OrderStatusView());

      default:
        return errorRoute();
    }
  }

  static PageRoute pageRoute(Widget page) {
    if (Platform.isIOS) {
      return CupertinoPageRoute(builder: (_) => page);
    }

    return MaterialPageRoute(builder: (_) => page);
  }
}
