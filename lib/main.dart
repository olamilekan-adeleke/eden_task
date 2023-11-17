import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app/app.dart';
import 'app/app_locators.dart';

Future<void> main() async {
  // set up firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await AppLocator.setup();
  await ScreenUtil.ensureScreenSize();

  runApp(const EdenApp());
}
