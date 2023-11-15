import 'package:flutter/material.dart';

import '../component/custom_text_widget.dart';
import '../constants/font_size.dart';

Route<dynamic> errorRoute() {
  return MaterialPageRoute(
    builder: (_) {
      return Scaffold(
        appBar: AppBar(title: const TextWidget('Page Not Found')),
        body: const Center(
          child: TextWidget('ERROR: Route not found', fontSize: kfsExtraLarge),
        ),
      );
    },
  );
}

Widget noPage() {
  return Scaffold(
    appBar: AppBar(title: const TextWidget('Page Not Done')),
    body: const Center(
      child: TextWidget('Page Still In Production', fontSize: kfsExtraLarge),
    ),
  );
}
