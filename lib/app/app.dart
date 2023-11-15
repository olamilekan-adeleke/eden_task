import 'package:eden_task/cores/constants/colors.dart';

import '../features/auth/presentation/pages/login_view.dart';
import 'package:flutter/material.dart';

class EdenApp extends StatelessWidget {
  const EdenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColor.primaryColor,
      ),
      initialRoute: LoginView.routeName,
    );
  }
}
