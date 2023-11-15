import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cores/constants/colors.dart';
import '../cores/navigator/app_router.dart';
import '../cores/navigator/router_generator.dart';
import '../features/auth/presentation/pages/login_view.dart';

class EdenApp extends StatelessWidget {
  const EdenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, Widget? child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(primaryColor: AppColor.primaryColor),
          initialRoute: LoginView.routeName,
          onGenerateRoute: RouteGenerator.generateRoute,
          navigatorKey: AppRouter.instance.navigatorKey,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
