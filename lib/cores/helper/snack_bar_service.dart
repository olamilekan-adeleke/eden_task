import 'package:flutter/material.dart';

import '../component/custom_text_widget.dart';
import '../constants/colors.dart';
import 'space_helper.dart';

class SnackBarService {
  static final EdgeInsets _margin = EdgeInsets.only(
    bottom: sh(100) - 120,
    left: 10,
    right: 10,
  );

  static void showErrorSnackBar(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(milliseconds: 2000),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.black,
        duration: duration,
        behavior: SnackBarBehavior.floating,
        margin: _margin,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        content: Row(children: [
          const Icon(Icons.error, color: AppColor.errorColor),
          horizontalSpace(),
          Flexible(
            child: TextWidget(message, color: AppColor.white, maxLines: 2),
          ),
        ]),
      ),
    );
  }

  static void showSuccessSnackBar(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(milliseconds: 2000),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.black,
        duration: duration,
        behavior: SnackBarBehavior.floating,
        margin: _margin,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        content: Row(children: [
          const Icon(Icons.check_circle, color: AppColor.successColor),
          horizontalSpace(),
          Flexible(
            child: TextWidget(message, color: AppColor.white, maxLines: 2),
          ),
        ]),
      ),
    );
  }

  static void showWarningSnackBar(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(milliseconds: 1500),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.black,
        duration: duration,
        behavior: SnackBarBehavior.floating,
        margin: _margin,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        content: Row(children: [
          const Icon(Icons.warning, color: AppColor.greyBackground),
          horizontalSpace(),
          Flexible(
            child: TextWidget(message, color: AppColor.white, maxLines: 2),
          ),
        ]),
      ),
    );
  }
}
