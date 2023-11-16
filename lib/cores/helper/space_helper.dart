import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Sized Box
SizedBox verticalSpace([double value = 10]) => SizedBox(height: value.sp);
SizedBox horizontalSpace([double value = 10]) => SizedBox(width: value.sp);

/// Calculates the sp (Scalable Pixel) depending on the device's screen size
double sp(double value) => value.sp;
double h(double value) => value.h;
double w(double value) => value.w;
double sr(double value) => value.r;

/// return a percentage of the screen height or width in respect to the  value given
double sh(double value) => (value / 100).sh;
double sw(double value) => (value / 100).sw;

// padding
EdgeInsetsGeometry paddingAll([double value = 10]) => EdgeInsets.all(value.sp);
EdgeInsetsGeometry symmetricPadding({num horizontal = 0, num vertical = 0}) {
  return EdgeInsets.symmetric(
    horizontal: w(horizontal.toDouble()),
    vertical: h(vertical.toDouble()),
  );
}

EdgeInsetsGeometry paddingOnly({
  double left = 0.0,
  double top = 0.0,
  double right = 0.0,
  double bottom = 0.0,
}) {
  return EdgeInsets.only(left: left, top: top, right: right, bottom: bottom);
}
